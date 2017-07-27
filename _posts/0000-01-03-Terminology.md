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
