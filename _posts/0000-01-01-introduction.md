<section data-background-image="images/securitay-title.jpg" width="70%">
</section>
Note: One of the reasons for doing this research and contributing to the CIS standard was the lack of existing information on Kubernetes Security.  That said there are some good presentations to go watch https://www.youtube.com/watch?v=BER8uridVIs - Securing Kubernetes, Jesse Endahl. https://www.youtube.com/watch?v=xpFpdYtSoBw - Security Best Practices for Kubernetes Deployment - Michael Cherny

---

# About Me

 - 18 Years in IT/Information Security
 - Managing Consultant at NCC Group PLC
 - Contributor at Security Stack Exchange
 - Contributing author to the CIS Docker and Kubernetes Standards

--

<img src="/images/Loch_goil_hebridean_princess.jpg"/>

--

<img src="/images/lochgoilhead_internet_access.jpg"/>

---

# Topics

* Containers 101 {% fragment %}
* Kubernetes Architecture {% fragment %}
* Kubernetes Deployment Options {% fragment %}
* Threat Model {% fragment %}
* Key Security Concerns {% fragment %}

Note:

We're starting off with a general look at containers, Docker and Kubernetes to provide a bit of context.

--

# What are Containers?

Note:

Main points here are that containers are essentially an application bundling and isolation technology.  The technology isn't really new but has taken off in the last 3-4 years.

--

<img src="/images/containersvvms.png"/>

Note:

This is an illustration of some of the perforrmance benefits that can be achieved with containers.  Essentially it takes servers from a 1 app. per VM model to a multiple app. per VM model.

--

# Where does Docker Come in?

Note:

So we briefly talk here about Docker the company, docker the product, docker the technology, and how they popularized the use of containers.

--

<img src="/images/docker.png"/>

Note:

Running through the three main areas here, the docker client which runs commands against a docker engine instnace which uses images to build containers, and that the images are stored in a registry.

--

<image src="/images/what-is-kubernetes.jpg"/>

Note: Brief overview of Kubernetes.  A system for creating and managing sets of containers.  some key terms, Nodes, Pods, services, Master Nodes, Worker Nodes, etcd
Credit - Photo by Axel Ahoi on Unsplash

--

"Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery"

Note:

quote from https://kubernetes.io 

--

# Demo Time!

Note:

The goal of this demo (detail in the demo_notes folder) is to show that a single YAML file can be used to create a multi-factor service.

--

<video src="/demo_videos/Create_service.mp4">

--

### Project Background

* Started by Google in 2014.
* Cloud Native Computing Foundation (CNCF)
* Rapid Development/Rapid Adoption

Note:

Kubernetes first release was in 2014 based on internal google projects like borg.  The 1.0 release was in 2015 at which point the CNCF was founded and Kubernetes handed over to that organization.  Very rapid development (Over 65k commits to the main repo) and adoption across a range of business sectors including financial services (e.g. Monzo), the public sector (e.g. the UK Home Office) and retail (e.g. Ocado http://ocadotechnology.com/blog/creating-a-distributed-data-centre-architecture-using-kubernetes-and-containers/)

--

<img src="/images/cncf.png"/>

Note:

the CNCF is basically a who's who of large cloud technology companies.  They run a large number of projects but Kubernetes is the only one that has "graduated" to release status.