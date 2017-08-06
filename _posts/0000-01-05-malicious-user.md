<img src="images/malicious-user.jpg"/>

Note:

Key difference is that a user with kubectl can create new containers with their specification.

Malicious users are harder to stop, as they can start new containers. Older versions of kubernetes basically had no divisions of rights once you were in a container and even now the restrictions may not get you all the way to "multi-tenant". If you look at presentations like the ones at Google I/O there's a sense that k8s isn't multi-tenant ready yet, but will get there over the next couple of versions.

--

# kubectl & Privileged Containers

Note:

Access to kubectl without additional controls is pretty quickly going to lead to cluster admin.  With privileged containers being available it's possible for an unconstrained user to execute things inside your cluster that will allow them to do what they want.

kubectl exec allows for command execution inside pods and if a user can create a "privileged" pod they can break out to the node fairly easily.

Kubernetes has the concept of namespaces to divide resources inside a cluster, but that's more of an administrative distinction than a security one. 

Also ability to pull secrets from Kubernetes secrets store is not segmented

--

# Access to Nodes

Note:

A user who can run containers can get acces to underlying nodes by mapping resources into the container, or running a "privileged" container.  Unfortunately pretty much every cluster I've looked at allows privileged containers, so a user who's not otherwise restricted can get full access to the underlying node.

PodSecurityPolicy is the approach that needs to be taken to address this.  Restrict what users can do with containers.