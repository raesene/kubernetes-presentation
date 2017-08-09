<image src="/images/what-is-kubernetes.jpg"/>

Note: Brief overview of Kubernetes.  A system for creating and managing sets of containers.  some key terms, Nodes, Pods, services, Master Nodes, Worker Nodes, etcd
Credit - Photo by Axel Ahoi on Unsplash

--

"Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery"

--

### Project Background

* Started by Google in 2014.
* Cloud Native Computing Foundation (CNCF)
* Rapid Development/Rapid Adoption

Note:

Kubernetes first release was in 2014 based on internal google projects like borg.  The 1.0 release was in 2015 at which point the CNCF was founded and Kubernetes handed over to that organization.  Very rapid development (Over 52k commits to the main repo) and adoption across a range of business sectors including financial services (e.g. Monzo), the public sector (e.g. the UK Home Office) and retail (e.g. Ocado http://ocadotechnology.com/blog/creating-a-distributed-data-centre-architecture-using-kubernetes-and-containers/)

--

# Demo Time!

--


### Key Components

<image src="/images/architecture.PNG"/>

Note: There are a wide range of Kubernetes components, but for the purposes of this talk these are the ones that we're going to focus on for this talk.


--

# Kubernetes Networking

---

### Kubernetes Deployment Optons

<img src="/images/wordcloud.png" width="75%"/>


Note:

There are currently over 66 different flavours of k8s available (https://docs.google.com/spreadsheets/d/1LxSqBzjOxfGx3cmtZ4EbB_BGCxT_wlxW_xgHVVa23es/edit#gid=0), in addition to the option of spinning up the cluster manually.  This leads to probably one of the larger problems for k8s security, which is that you get the defaults that the cluster provider decided were appropriate from a security standpoint, and this is generally opaque to the end user.

On premises could be something like kubeadm or kismatic. Cloud base self-managed could be something like kops, cloud-based provider managed is more like GKE.

There are some big differences between quite lightweight installers, to full PAAS offerings like Openshift.

--

# The importance of secure defaults!