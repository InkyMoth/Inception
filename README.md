*This project has been created as part of the 42 curriculum by gaasseli.*

# Description
Inception is a project consisting of familiarizing yourself with using Docker and docker containers by creating your own service infrastructure inside of a virtual machine(VM).

### Virtual Machines vs Docker
While a VM consists of running an isolated operating system within a host machine, Docker allows you to run a select few services and applications, each within their own isolated environment dubbed containers. A Docker Network will allow these containers to interact with one another (more on Docker Networks below).


### Secrets vs Environment Variables
Environment Variables, generally used through an operating system's terminal, are variables accessible anywhere within its environment. This ease of access, however, makes the contents of those variables completely unsecured. In order to store sensitive data such as passwords or credentials, we need to make use of Docker Secrets.

Secrets allow for the encrypted transfer of information that is only accessible to the services explicitly given permission to access it, making them one of the best options to keep your containers' data secure.


### Docker Network vs Host Network
In order to allow the containers to communicate with each other, they will need a shared network to connect to. This begs the question "What kind of network should be used, namely between a Docker Network and a Host Network?".

Simply put, the difference between a Docker Network and a Host Network is that a container using Host Network will not be be isolated from the host machine, no longer having its own separate IP address, using the host machine's instead. As such, while there can be cases to use the Host Network, it is generally preferable to use a Docker Network instead, especially for this project, as to ensure the infrastructure will remain properly isolated.


### Docker Volumes vs Bind Mounts
When it comes to storing data within our Docker infrastructure, we will want certain pieces of information to remain between startups and not be reset between every restart. In order to respond to that demand, the main two options at our disposal are volumes and bind mounts. Both of these will work by storing data on the Docker host, but they will manage said data differently.

A bind mount is given a file or directory on the host machine to use to store data, as well as the ability to modify the host machine's filesystem within this directory, this makes it a dangerous approach to storing data, as it can harm your host machine. A volume, however, will instead create a new directory on the host machine during the creation of the service or container mounted to it. This approach functions by giving your container or service access only to a dedicated data folder on your docker host made specifically for it, making it a much safer approach to have access to persistent data.


# Instructions
In order to use try this project yourself, run a virtual machine supporting Linux Debian and clone this repository. Open the repository in terminal an run the command `make run` to start the infrastructure.

# Resources
As well as the help of colleagues, some of which had done the project while others were actively working on it at the time, this project was mainly done with the help of [this guide](https://inception.cluzet.fr/) and the [official Docker documentation](https://docs.docker.com).

No Generative AI or LLM was used in the learning process or the making of this project, as well as the creation of this README.
