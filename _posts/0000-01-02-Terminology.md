<img src="/images/some-terminology.jpg"/>

--

# Pods

Note:

A pod is a group of containers which sit together on a single node.  The notable feature of pods is that the containers making up a pod share some namespaces, allowing for easy communication.  The general rule is that you group containers together in pods if they communicate by means other than over the network (e.g. sockets or file system level comms)

--

# Nodes

Note:

A host within a cluster gets called a node.  A node can be a VM or a physical system or an instance of something like an EC2 service.

--

# Control Plane

Note:

Also known as the "master node" the control plane houses the services that manage the cluster.

--

# Services

Note:

Pods are generally deployed as services within the cluster.
