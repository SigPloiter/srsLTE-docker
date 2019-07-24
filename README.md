Docker Implementation for srsLTE
=================================

This is a docker implementation for the srsEPC and srsENB. The docker-compose file will create two services one for the EPC and the other for the eNB, create two separate networks and attach the containers to them.

This docker implementation supports SoapySDR and BladeRF

srsLTE project repo: https://github.com/srsLTE/srsLTE

Docker Requirements:
---------------------

Install docker on the host, below example for an ubuntu host, tailor the below to match your system as needed

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker gh0

#To verify docker is installed correctly, run the test container

sudo docker run hello-world


Download and build srsLTE: (on host) 
---------------------------------------

```
git clone https://github.com/srsLTE/srsLTE-docker.git
cd srsLTE-docker
git clone https://github.com/srsLTE/srsLTE.git
sudo docker-compose up -d

#To allow communication between containers
sudo iptables -I FORWARD 1 -j ACCEPT
```

Connect to containers and configure srsLTE:
-------------------------------------------

Open two different terminals and attach to the containers

#### Attach for the srsEPC container to configure it

```
sudo docker container attach srsepc01

The srsepc container has ports 2123/udp and 2152/udp exposed to the host so that users can communicate directly to the core container from the host if they only need to run the core container to run their individual tests
```

### Attach to the srsENB container to configure it

```
sudo docker container attach srsenb01
```

CTRL+P+Q to deattach from the container and remain running


Execution Instructions
----------------------

The srsUE, srsENB and srsEPC applications include example configuration files
that should be copied (manually or by using the convenience script) and modified,
if needed, to meet the system configuration. The configuration files will be located at

srsEPC: /etc/srslte/epc.conf

srsENB: /etc/srslte/enb.conf


### srsEPC

On machine 1, run srsEPC as follows:

```
sudo srsepc
```

Using the default configuration, this creates a virtual network interface
named "srs_spgw_sgi" on machine 1 with IP 172.16.0.1. All connected UEs
will be assigned an IP in this network.

### srsENB

Also on machine 1, but in another console, run srsENB as follows:

```
sudo srsenb
```


