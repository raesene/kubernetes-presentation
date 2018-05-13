<image src="/images/kubernetes-architecture.jpg"/>

--

### Some Terminology

* Pods
* Services
* Nodes

--


### Key Components

<image src="/images/architecture.PNG"/>

Note: There are a wide range of Kubernetes components, but for the purposes of this talk these are the ones that we're going to focus on for this talk.

Important thing to note about a lot of this stuff, is that it's all linux primitives.


--

# Kubernetes Networking

* Overlay Network
* Many Options (e.g. weave, calico, flannel)

Note:  

Overlay networking is a key concept for Kubernetes clusters.  The overlay network allows containers to communicate with each other as though they were all on the same local LAN, even if the underlying nodes are not co-located.  In the basic case the cluster network is flat.

The wide range of options for networking add some complexity to the potential configurations of k8s clustes. Some of these options have their own system services (e.g. etcd stores) which can increase the attack surface of the cluster.

--

### Kubernetes Deployment Optons

<img src="/images/wordcloud.png" width="75%"/>


Note:

There are currently over 72 different flavours of k8s available (https://docs.google.com/spreadsheets/d/1LxSqBzjOxfGx3cmtZ4EbB_BGCxT_wlxW_xgHVVa23es/edit#gid=0), in addition to the option of spinning up the cluster manually.  This leads to probably one of the larger problems for k8s security, which is that you get the defaults that the cluster provider decided were appropriate from a security standpoint, and this is generally opaque to the end user.

On premises could be something like kubeadm or kismatic. Cloud base self-managed could be something like kops, cloud-based provider managed is more like GKE.

There are some big differences between quite lightweight installers, to full PAAS offerings like Openshift.

One of the challenges in reviewing "Kubernetes" is that this variety means that there are lots of different deployment mechanisms, which have different security options set by default.

--

# So Where does the cloud come in?

--

### Cloudy Clusters

* GKE
* ACS/AKS
* EKS
* OCP
* ...

--

# The importance of secure defaults!