<section data-background-image="images/title.jpg">
</section>
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

--

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