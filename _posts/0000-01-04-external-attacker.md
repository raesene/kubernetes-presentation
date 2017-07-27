# External Attacker

--

# Network Visibility

* 2379/tcp      open  etcd
* 4194/tcp      open  cAdvisor
* 6443/tcp      open  API Server
* 8080/tcp      open  Insecure API Server
* 6781-6783/tcp open  Weave
* 10250/tcp     open  kubelet
* 10255/tcp     open  kubelet (Read Only)

--

# Information Disclosure with cAdvisor

Note:

Information disclosure via cAdvisor can provide an attacker useful information (e.g. what pods are running on a given sysmtem) but is unlikely to lead to compromise on it's own.

--

# Attacking the Kubelet

Note: 

The kubelet is a very interesting component from a security standpoint as it controls access to the container engine (e.g. Docker) running on the node.  There are generally 2 ports associated with the kubelet process.  10250/TCP is the read/write port, and 10255/TCP is the read-only port.  Prior to 1.5 all access to the kubelet was unauthenticated, so if you could see the port you could execute commands against it.  Since then it has been possible to restrict access, however many clusters still haven't implemented this protection.   Kubelet authorization is possible but the default is alwaysAllow https://kubernetes.io/docs/admin/kubelet-authentication-authorization/#kubelet-authentication

--

# API Server Attacks

Note:

From an external perspective, getting easy access to the API server would rely either on a stolen set of credentials, or on the cluster opening the insecure port to the external network.  
If the insecure port ex

--

# Attacking etcd

Note:

We can used etcdctl to dump the contents of the database.  Importantly one of the things that etcd stores is all Kubernetes secrets are stored in clear text in etcd.  An attacker who can either get access to the etcd service or can get access to the underlying node can pwn all secrets.   A good secrets management post is at https://medium.com/on-docker/secrets-and-lie-abilities-the-state-of-modern-secret-management-2017-c82ec9136a3d#.k3yxv32o9
