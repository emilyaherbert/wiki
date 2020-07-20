We are using Kubernetes via the Microk8s Kubernetes deployment.

- https://github.com/apache/openwhisk-deploy-kube/blob/master/docs/configurationChoices.md#persistence
- https://ubuntu.com/tutorials/install-a-local-kubernetes-with-microk8s#2-deploying-microk8s

# Installation and Deployment

## Install Microk8s

1. Install microk8s.

```
$ sudo snap install microk8s --classic
$ sudo microk8s.enable dns dashboard
```

2. Add any users to the microk8s group.

```
$ sudo usermod -a -G microk8s emily
$ sudo chown -f -R emily ~/.kube
```

3. (optional) Alias `k` to `microk8s.kubectl`, in your `~/.bashrc`.

```
alias k='microk8s.kubectl'
```

## Deploy Openwhisk

We now have a single node Kubernetes cluster running, and we are ready to deploy Openwhisk.

4. Create a namespace and label the node.

```
$ microk8s.kubectl create namespace openwhisk
$ microk8s.kubectl label nodes --all openwhisk-role=invoker
```

5. Install helm.

```
$ sudo snap install helm --classic
```

6. Download openwhisk deployment repo from (https://github.com/apache/openwhisk-deploy-kube).

7. Create a cluster configuration file, in `openwhisk-deploy-kube/`, create `mycluster.yaml`.

```
whisk:
  ingress:
    type: NodePort
    apiHostName: <apihost>
    apiHostPort: 31001

nginx:
  httpsNodePort: 31001
```

Replace `<apihost>` with the correct field.

8. Deploy Openwhisk.

```
$ helm install owdev ./helm/openwhisk -n openwhisk -f mycluster.yaml
```

If it tells you that the `Kubernetes cluster unreachable`, then try this. No idea what it does.

```
$ k config view --raw >~/.kube/config
```

## Install wsk CLI

9. Download the wsk CLI binary from [here](https://github.com/apache/openwhisk-cli/releases/).

10. Place the binary in your path.

## Configure Openwhisk

11. Configure Openwhisk with the wsk CLI.

```
$ wsk property set --apihost <apihost>:31001
$ wsk property set --auth 23bc46b1-71f6-4ed5-8c54-816aa4f8c502:123zO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP
```

Where `<apihost>` is the ip of your machine.

## Test Install

```
$ helm test owdev -n openwhisk
```

# Nodes (WIP)

## Adding Nodes

We may want to add nodes to our deployment.

1. Perform the Install step above for each node (machine) that you want to add to the cluster.

2. Setup the cluster host.

```
$ microk8s add-node
```

3. Use the commands printed from step 2 on the non-host nodes to join them to the cluster.

4. Check it.

```
$ microk8s.kubectl get nodes
```

# Debugging

## Pods

```
$ microk8s.kubectl logs <podName> --namespace <namespace>
```

