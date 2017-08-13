<img src="images/malicious-container.jpg"/>

--

# Increased Attack Surface

 * Container Filesystem Access {% fragment %}
 * "Internal" Network Position {% fragment %}
 * Kernel Attacks {% fragment %}

--

# Attacking Service Account Tokens

Note:  from demo notes, service account tokens can be very dangerous if RBAC isn't used as they're cluster admins.

--

<video src="/demo_videos/service-token.mp4"/>

--

# API Server Attacks

Note:

Access to the insecure port is much more likely from an internal perspective than an external perspective (in that it's game over if it happens).  If the insecure port is enabled it's generally a cluster-admin, so access to it is "game over"

--

<video src="/demo_videos/insecure-api-port.mp4"/>

--

# Attacking etcd

Note:

We can used etcdctl to dump the contents of the database.  Importantly one of the things that etcd stores is all Kubernetes secrets are stored in clear text in etcd.  An attacker who can either get access to the etcd service or can get access to the underlying node can pwn all secrets.   A good secrets management post is at https://medium.com/on-docker/secrets-and-lie-abilities-the-state-of-modern-secret-management-2017-c82ec9136a3d#.k3yxv32o9

--

<video src="/demo_videos/etcd.mp4"/>

--

# Attacking the OS kernel

Note:  There are some things that can be done to mitigate this kind of risk.  Specifically doing things filtering syscalls.  Docker has a default filter here but worth noting that Kubernetes disables it by default, so you need to re-enable it explicitly with SecurityContext to put it back in.