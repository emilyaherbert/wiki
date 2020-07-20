# Administering OpenWhisk

You can administer OpenWhisk using `wskadmin`. Because `wskadmin` requires credentials for access, it is deployed in a pod inside k8s. Thus, you can invoke `wskadmin` with:

```
kubectl -n openwhisk -ti exec owdev-wskadmin -- wskadmin user list guest
```

This enters the `owdev-wskadmin` pod and executes `wskadmin user list guest`, which will print all of the users in the namespace `guest`. More information about administering OpenWhisk can be found [here](https://github.com/apache/openwhisk-deploy-kube#administering-openwhisk).

## Users and Namespaces

OpenWhisk manages authorization using users and namespaces. A user is an OpenWhisk user and a namespace is a shared space for multiple users to share the same configuration.

You can create a user with:

```
kubectl -n openwhisk -ti exec owdev-wskadmin -- wskadmin user create NAME
```

This creates a unique key for user `NAME`, which can be linked to the `wsk` CLI using:

```
wsk -i property set --auth KEY
```

However, more often than not, you will want to create users in conjunction with a namespace. This can be done via:

```
kubectl -n openwhisk -ti exec owdev-wskadmin -- wskadmin user create NAME -ns NAMESPACE
```

Again, this creates a unique key which can be used to link with the `wsk` CLI:

```
wsk -i property set --auth KEY
```

You can check that this has completed correctly by using:

```
wsk -i namespace list
```

Which should display your `NAMESPACE`. More information on using names and namespaces with OpenWhisk deployed on Kuburnetes, see [here](https://github.com/apache/openwhisk/issues/4687).

## Packages

Packages are used to organize a set of related actions (i.e. all of the actions associated with one set of experiments).

To create your package:

```
wsk -i package create PACKAGE
```

Where `PACKAGE` is the name of your package. Then get a summary of the package:

```
wsk -i package get --summary PACKAGE
```

## Configuring deployment limits

OpenWhisk has limits for the maximum total requests per minute, total number of concurrent invocations, and others. These aren't particularly helpful for us, so they can be changed with:

```
kubectl -n openwhisk -ti exec owdev-wskadmin -- wskadmin limits --help
```

In our specific case, we want to increase the maximum number of invocations per minute to 999999 for the `scaling` namespace:

```
kubectl -n openwhisk -ti exec owdev-wskadmin -- wskadmin limits set scaling --invocationsPerMinute 999999
```

# Actions

Actions are the OpenWhisk serverless function. They are deployed using the `wsk` CLI and can be invoked using either the `wsk` CLI or `curl`.

## Deploying a web action

1. Create `hello.js` with:

```
function main() {
    return { body: 'sup!' };
}
```

2. Create the action:

```
wsk -i action create /NAMESPACE/PACKAGE/hello hello.js --web true
```

This creates a "web action" with some name `/NAMESPACE/PACKAGE/hello` (see above), which can be invoked using `curl`. The action URL can be found by:

```
wsk -i action get /NAMESPACE/PACKAGE/hello --url | tail -1
```

3. Invoke the action!

```
curl -k `wsk -i action get /NAMESPACE/PACKAGE/hello --url | tail -1`
```

## Calling external libraries

If you want an action to call outside libraries, you need to jump through additional hoops.

1. Create `hello.js` as above.

2. Do this thing with npm:

```
npm install --production
```

3. Package it together:

```
zip -rq action.zip *
```

3. Create the action:

```
wsk -i action create /NAMESPACE/PACKAGE/hello --kind nodejs:8 action.zip --web true
```

4. Invoke!

```
curl -k `wsk -i action get /NAMESPACE/PACKAGE/hello --url | tail -1`
```

More information about calling external APIs can be found [here](https://github.com/apache/openwhisk/blob/master/docs/actions-nodejs.md#using-actions-to-call-an-external-api). A good walkthrough of how to use `request` can be found [here](https://horeaporutiu.com/blog/openwhisk-web-actions-and-rest-api-calls/).

## Debugging an action

Get a list of the recent action activations:

```
wsk -i activation list
```

Then display the log for a particular activation:

```
wsk -i activation logs LOG_ID --strip
```

More information about debugging activations can be found [here](https://github.com/apache/openwhisk/blob/master/docs/actions.md#working-with-activations).

