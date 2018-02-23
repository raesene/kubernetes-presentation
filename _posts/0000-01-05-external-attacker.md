<img src="images/external-attackers.jpg"/>

--

### External Network Visibility

* 2379/tcp      open  etcd
* 4194/tcp      open  cAdvisor
* (6|8)443/tcp  open  API Server
* 8080/tcp      open  Insecure API Server
* 10250/tcp     open  kubelet
* 10255/tcp     open  kubelet (Read Only)
* [various]     open  [Network plugins]

--

# Shodan & Friends

--

<img src="images/exposed_etcd.png"/>

Note:

Worth mentioning the Tesla story at this point.

--

# Information Disclosure with cAdvisor

Note:

Information disclosure via cAdvisor can provide an attacker useful information (e.g. what pods are running on a given system) but is unlikely to lead to compromise on it's own.

--

<video src="/demo_videos/cadvisor.mp4"/>

--

# Attacking the Kubelet

Note: 

The kubelet is a very interesting component from a security standpoint as it controls access to the container engine (e.g. Docker) running on the node.  There are generally 2 ports associated with the kubelet process.  10250/TCP is the read/write port, and 10255/TCP is the read-only port.  Prior to 1.5 all access to the kubelet was unauthenticated, so if you could see the port you could execute commands against it.  Since then it has been possible to restrict access, however many clusters still haven't implemented this protection.   Kubelet authorization is possible but the default is alwaysAllow https://kubernetes.io/docs/admin/kubelet-authentication-authorization/#kubelet-authentication

--

<video src="/demo_videos/kubelet-read-only.mp4"/>

--

<video src="/demo_videos/kubelet.mp4"/>
