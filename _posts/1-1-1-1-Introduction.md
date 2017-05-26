# Kubernetes

## Container Clustering, Catastrophe?

---

# About Me

 - 16 Years in IT/Information Security
 - Managing Consultant at NCC Group PLC
 - Contributor at Security Stack Exchange

---

# Topics

* Kubernetes Deployment Options {% fragment %}
* Threat Models & Attack Surface {% fragment %}
* Key Security Concerns {% fragment %}

---

# Kubernetes Deployment Optons

* On Premises {% fragment %}
* Cloud-based Self-Managed {% fragment %}
* Cloud-based Provider Managed {% fragment %}


Note:

There are currently over 60 different flavours of k8s available (https://docs.google.com/spreadsheets/d/1LxSqBzjOxfGx3cmtZ4EbB_BGCxT_wlxW_xgHVVa23es/edit#gid=0), in addition to the option of spinning up the cluster manually.  This leads to probably one of the larger problems for k8s security, which is that you get the defaults that the cluster provider decided were appropriate from a security standpoint, and this is generally opaque to the end user.

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

Threat models are very important in security.  First question in response to "Is this secure?" is "From what"

--

# External Attackers

--

# Attacker with access to a single container

--

# User with rights to run a container

---

# External Attacker

--

# Network Visibility

* 4194/tcp      open  cAdvisor
* 6443/tcp      open  API Server
* 6781-6783/tcp open  Weave
* 10250/tcp     open  kubelet
* 10255/tcp     open  kubelet (Read Only)

--

# Information Disclosure with cAdvisor

--

# API Server Attacks

--

# Attacking the Kubelet

---

# Attacker with access to a single container

--

# Increased Attack Surface

 * Filesystem {% fragment %}
 * "Internal" Network Position {% fragment %}
 * Kernel Attacks {% fragment %}

--

# Attacking Service Account Tokens

--

# Internal Network Attacks

--

# Attacking the OS kernel

---

# Malicious User 

--

# Access to Nodes

---

# Key Security Concerns

--

# API Server Authentication
* Basic Auth
* Token Auth
* Certificate Auth
* External Auth

Note:

There's 3 internal ways that k8s can authenticate users as well as referrring to an external service.  All three suffer some problems.  Basic and token authentication have the problem that they are static credentials which are held in the clear on the API server (and are also likely to be held on the clear on the clients too).  Also they're relatively inflexible (require API server retstart to change).  All in all not a great option.

Certificate authentication has some advantages in this regard, however there's currently no support for certificate revokation, so a compromised credential cannot easily be invalidatd.  Also within k8s the facilities for managing certificate are fairly basic.

Important point is "what are we authenticating?".  There's obviously the point of users of the cluster, however we're also authenticating the various components of the cluster (e.g. the scheduler needs to be able to talk to the Kubelet to schedule pods).  Additionally there's the possibility of a pod wanting to access the API server, via service tokens.

This particular concept causes one of the areas where cluster security can provide an unexpected, unpleasant, surprise (https://hackernoon.com/capturing-all-the-flags-in-bsidessf-ctf-by-pwning-our-infrastructure-3570b99b4dd0) .  Lets look at a cluster which has a container spun up on it and the service account token that gets automounted intot the container.

--

# Insecure Port

Note: 

The insecure port (typically 8080) is still used by some distributions and in at least one case, it's bound to a network interface that faces into the cluster (ACS), which means any user of the cluster can access it and execute commands.

--

# API Server Authorisation
* ABAC
* RBAC
* Webhook

Note:

Once you've got authenticated users the question of what they're allowed to do becomes relevant.  One of the weaknesses of earlier distributions of K8s is that they tended not to implement any significant level of authorisation, so an attacker who gains access to a cluster authentication token or credential, gets full-cluster access.

An important point to note about the k8s approach to authorisation is that it's cumulative, so if you have multiple authorisation mechanisms enabled and any one of the mechanisms provides access, access is provided.  This can create the possibility of nasty surprises...

RBAC is generally considered the way authorisation will be handled going forward.  It does introduce, however, some complexity to managing a cluster.  For example on a kubeadm 1.6 cluster, there are 40 cluster roles created by default.

Also due to K8s not managing user identity, questions like "who has cluster-admin rights" become pretty difficult to answer.  For example if a certificate is created froma trusted CA with the system:masters group assigned, there's nothing within k8s that tracks the lifecycle of that certificate.

--

 # Control Access to the Kubelet

--

 # Control Access to etcd

--

 # Other things to think about
 * PodSecurityPolicy {% fragment %}
 * SecurityContext {% fragment %}

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
