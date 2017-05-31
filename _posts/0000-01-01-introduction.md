# Kubernetes

## Container Clustering, Catastrophe?

Note: One of the reasons for doing this research and contributing to the CIS standard was the lack of existing information on Kubernetes Security.  That said there are some good presentations to go watch https://www.youtube.com/watch?v=BER8uridVIs - Securing Kubernetes, Jesse Endahl. https://www.youtube.com/watch?v=xpFpdYtSoBw - Security Best Practices for Kubernetes Deployment - Michael Cherny

---

# About Me

 - 16 Years in IT/Information Security
 - Managing Consultant at NCC Group PLC
 - Contributor at Security Stack Exchange
 - Contributing author to the CIS Docker and Kubernetes Standards

---

# Topics

* Kubernetes Architecture {% fragment %}
* Kubernetes Deployment Options {% fragment %}
* Threat Models & Attack Surface {% fragment %}
* Key Security Concerns {% fragment %}

Note:

Not covering general docker / container security much, see previous presentations :)

---

# What is Kubernetes?

Note: Brief overview of Kubernetes.  A system for creating and managing sets of containers.  some key terms, Nodes, Pods, services, Master Nodes, Worker Nodes, etcd


--

### Key Components

<image src="/images/architecture.PNG"/>

Note: There are a wide range of Kubernetes components, but for the purposes of this talk these are the ones that we're going to focus on for this talk.


---

# Kubernetes Deployment Optons

* On Premises {% fragment %}
* Cloud-based Self-Managed {% fragment %}
* Cloud-based Provider Managed {% fragment %}


Note:

There are currently over 60 different flavours of k8s available (https://docs.google.com/spreadsheets/d/1LxSqBzjOxfGx3cmtZ4EbB_BGCxT_wlxW_xgHVVa23es/edit#gid=0), in addition to the option of spinning up the cluster manually.  This leads to probably one of the larger problems for k8s security, which is that you get the defaults that the cluster provider decided were appropriate from a security standpoint, and this is generally opaque to the end user.

On premises could be something like kubeadm or kismatic. Cloud base self-managed could be something like kops, cloud-based provider managed is more like GCE.

There are some big differences between quite lightweight installers, to far more opionated distributions (e.g. openshift)

--

# The importance of secure defaults!

---

# Some Terminology

--

# Attack Surface

--

<img src="/images/risk.png"/> 

Note: 

Image from wikimedia - Riskgamenut -  https://upload.wikimedia.org/wikipedia/en/5/55/Riskgameboard.svg - CC BY-SA 3.0
Concept of attack surface is very important in security, the larger the attack surface the more there is to secure and the larger the scope for security vulnerabilities

--

# Threat Model

Note:

Threat models are very important in security.  First question in response to "Is this secure?" is "From what?"

--

# External Attackers

Note:

Here we have an attacker who can see the cluster across a network (either over the Internet for a cloud based cluster, or over an internal network)

--

# Attacker with access to a single container

Note:

Here we've got an attacker who has managed to get command execution access to a single container.  For example using a vulnerability in a web application deployed to the cluster.

--

# User with rights to run a container

Note: 

Here we've got a user who has some level of cluster rights, below cluster-admin. So there's an intention that they'll be able to execute some actions on the cluster and not others.

---

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

---

# Attacker with access to a single container

--

# Increased Attack Surface

 * Container Filesystem Access {% fragment %}
 * "Internal" Network Position {% fragment %}
 * Kernel Attacks {% fragment %}

--

# Attacking Service Account Tokens

Note:  from demo notes, service account tokens can be very dangerous if RBAC isn't used as they're cluster admins.

--

# Internal Network Attacks

Note:  Default cluster configuration is that each cluster is a flat network space.  Kubernetes does provide a facility for limiting this with NetworkPolicy, however the network plugin needs to support it.  Calico is the only one I'm currently aware of which does that.

--

# Attacking the OS kernel

---

# Malicious User 

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

---

# Key Security Concerns

--

# Insecure Port

```
--insecure-port=0
--insecure-bind-address - Not Set
```


Note: 

The insecure port (typically 8080) is still used by some distributions and in at least one case, it's bound to a network interface that faces into the cluster (ACS), which means any user of the cluster can access it and execute commands.

--

# API Server Authentication

```
--anonymous-auth=false
--basic-auth-file - Not Set
--token-auth-file - Not Set
```

Note:

There's 3 internal ways that k8s can authenticate users as well as referrring to an external service.  All three suffer some problems.  Basic and token authentication have the problem that they are static credentials which are held in the clear on the API server (and are also likely to be held on the clear on the clients too).  Also they're relatively inflexible (require API server retstart to change).  All in all not a great option.

Certificate authentication has some advantages in this regard, however there's currently no support for certificate revokation, so a compromised credential cannot easily be invalidatd.  Also within k8s the facilities for managing certificate are fairly basic.

Important point is "what are we authenticating?".  There's obviously the point of users of the cluster, however we're also authenticating the various components of the cluster (e.g. the scheduler needs to be able to talk to the Kubelet to schedule pods).  Additionally there's the possibility of a pod wanting to access the API server, via service tokens.

This particular concept causes one of the areas where cluster security can provide an unexpected, unpleasant, surprise (https://hackernoon.com/capturing-all-the-flags-in-bsidessf-ctf-by-pwning-our-infrastructure-3570b99b4dd0) .  Lets look at a cluster which has a container spun up on it and the service account token that gets automounted intot the container.

--


# API Server Authorisation

```
--authorization-mode=RBAC
```


Note:

Once you've got authenticated users the question of what they're allowed to do becomes relevant.  One of the weaknesses of earlier distributions of K8s is that they tended not to implement any significant level of authorisation, so an attacker who gains access to a cluster authentication token or credential, gets full-cluster access.

An important point to note about the k8s approach to authorisation is that it's cumulative, so if you have multiple authorisation mechanisms enabled and any one of the mechanisms provides access, access is provided.  This can create the possibility of nasty surprises...

RBAC is generally considered the way authorisation will be handled going forward.  It does introduce, however, some complexity to managing a cluster.  For example on a kubeadm 1.6 cluster, there are 40 cluster roles created by default.

Also due to K8s not managing user identity, questions like "who has cluster-admin rights" become pretty difficult to answer.  For example if a certificate is created froma trusted CA with the system:masters group assigned, there's nothing within k8s that tracks the lifecycle of that certificate.

--

 # Control Access to the Kubelet

 ```
 --anonymous-auth=false
 --authorization-mode - Not set to "AlwaysAllow"
 --read-only-port=0
 --cadvisor-port=0
 ```

--

 # Control Access to etcd

 ```
 --client-cert-auth=true
 --auto-tls=false
 --peer-client-cert-auth=true
 --peer-auto-tls=false
 ```

--

 # Other things to think about
 * PodSecurityPolicy {% fragment %}
 * SecurityContext {% fragment %}
 * Network segmentation {% fragment %}

 Note: 

 There

---

# Resources

* CIS Security Guide for Kubernetes - https://learn.cisecurity.org/benchmarks
* KubeAutoAnalyzer - https://github.com/nccgroup/kube-auto-analyzer

---

# Conclusion

* Security Model isn't perfect, but is improving.
* Default Security Options very important.
* Always think about your threat model and attack surface :)

---

# Questions

* Twitter - @raesene
* E-mail - rory.mccune@nccgroup.trust
