https://hub.helm.sh/charts/couchdb/couchdb/3.2.0
https://medium.com/faun/deploying-a-couchdb-cluster-on-kubernetes-d4eb50a08b34

# Deploying

We are going to deploy a single CouchDB pod on Kubernetes using a Helm chart.

1. Add CouchDB to Helm. (Although it should already be there.)

```
$ helm repo add couchdb https://apache.github.io/couchdb-helm
```

2. Create a UUID.

```
$ curl https://www.uuidgenerator.net/api/version4 2>/dev/null | tr -d -
```

3. Install the Helm chart.

```
$ helm install my-release couchdb/couchdb \
    --set couchdbConfig.couchdb.uuid=<uuid> \
    --set clusterSize=1
```

This will install CouchDB on Kubernetes with the `<uuid>` from Step 2 and a
cluster size of 1. Other configuration options can be found
[here](https://hub.helm.sh/charts/couchdb/couchdb/3.2.0). I'm not quite sure
what the purpose of the uuid is for, but its necessary for deployment.

In particular, this will start a CouchDB pod inside of the Kubernetes cluster
and will start a ClusterIP service that listens on port 5984 and that allows you to interact with CouchDB *from inside of the CouchDB pod*. You can verify this
by executing:

```
$ curl -X GET http://127.0.0.1:5984/
```

This should fail, as it cannot connect to CouchDB. Next, try:

```
$ k exec --namespace default -it my-release-couchdb-0 -c couchdb \
    -- curl -X GET http://127.0.0.1:5984/
```

This should succeed, as it is executing `curl` inside of the
`my-release-couchdb-0` pod.

4. Retrieve the admin credentials.

```
$ k get secret my-release-couchdb \
    -o go-template='{{ .data.adminUsername }}' | base64 --decode
$ k get secret my-release-couchdb \
    -o go-template='{{ .data.adminPassword }}' | base64 --decode
```

5. Follow the instructions printed from Step 3, using the credentials retrieved
    in Step 4.

6. Expose the CouchDB pod to the outside world.

Create a `services.yaml`:

```
---
kind: Service
apiVersion: v1
metadata:
  name: my-release-nodep-svc 
  labels:
    app: couch
spec:
  type: NodePort            # NodePort service
  ports:
  - port: 5984
    nodePort: 30984         # external port
    protocol: TCP
  selector:
    app: couchdb       # label selector
```

And then:

```
$ k create -f services.yaml
```

This will create a NodePort service that listens on port 30984 *outside of the 
Kubernetes cluster* and forwards it to port 5984 *inside of the Kubernetes
cluster*.

7. Create a database.

```
$ curl -X PUT http://<username>:<password>@localhost:30984/<dbname>
```
