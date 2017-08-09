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

# Internal Network Attacks

Note:  Default cluster configuration is that each cluster is a flat network space.  Kubernetes does provide a facility for limiting this with NetworkPolicy, however the network plugin needs to support it.  Calico is the only one I'm currently aware of which does that.

--

# Attacking the OS kernel

Note:  There are some things that can be done to mitigate this kind of risk.  Specifically doing things filtering syscalls.  Docker has a default filter here but worth noting that Kubernetes disables it by default, so you need to re-enable it explicitly with SecurityContext to put it back in.