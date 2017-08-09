# Kubernetes Architecture

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