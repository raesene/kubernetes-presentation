<image src="/images/threat-model.jpg"/>

Note:

Threat models are very important in security.  First question in response to "Is this secure?" is "From what?".  Also very important when discussing Kubernetes security with developers or other stake holders as they may feel that a deployment is secure when they've explicitly ruled out some threat models (e.g. malicious container)

--

## External Attackers

Note:

Here we have an attacker who can see the cluster across a network (either over the Internet for a cloud based cluster, or over an internal network)

--

## Attacker with access to a single container

Note:

Here we've got an attacker who has managed to get command execution access to a single container.  For example using a vulnerability in a web application deployed to the cluster.

--

## User with rights to run a container

Note: 

Here we've got a user who has some level of cluster rights, below cluster-admin. So there's an intention that they'll be able to execute some actions on the cluster and not others.
