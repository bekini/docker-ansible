# docker-ansible - run from a container 

## My Information
### I have looked at those link's
https://medium.com/@iced_burn/run-ansible-with-docker-9eb27d75285b
https://github.com/spy86/docker-ansible

### my work dir's
ansible dir: /home/bekini/ansible/test_docker_ansible
ansible docker: ~/docker/ansible

### Files are made from at template in this format:
 IP:host name:user:passwd:
 172.42.42.211:ansible1:vagrant:xxxx:
 
### files to make
 files copied to docker image ------------------
 - .ssh/config
 - .ssh/known_hosts

 ansible inventory used for connect to ansible 'clients'
 inventory is used on 'work' PC running docker image

## demands
Ansible test host should be running to have ssh connect set up
User should have ssh login with certificat

Add ansible test hosts to .ssh/config

### ssh certificat 
create a ssh private key in docker/ssh, this is in '.gitignore'  (ssh-keygen -t rsa)

put ansible clients in 'test_hosts', this file is placed in docker images.

running 'make' will create ansible inventory and files for ssh connect and place them in docker image.

If 'Ansible test hosts' are up and running and user have a ssh with certificat, Ansible docker users public key will be added to the 'Ansible clients'

## This landscape setup for testing ansible-docker 
w540 - docker landscape
w540 - vagrant: /usr/lib/libvirt/vagrant/ansible/Vagrantfile - makes two hosts Ubuntu 18.04 - ansible1 ansible2

## Authentification by ssh certificat 
 I make a special private key for this 'project' in a folder "ssh" this folder is in .gitignore !
 information in ssh folder are copied to container /root/.ssh

## Running a playbook 
hosts description are in inventory made at time we make dockerimage ( copy ssh 'things' to container)
At this time the name on the container is bk-ansible

$ docker run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles  --rm bk-ansible ansible-playbook playbook.yml -i testX

# check hosts connect / execute
$ docker run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles  --rm bk-ansible ansible all -m ping playbook.yml -i testX

# run the same with only specific host
$ docker run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles  --rm bk-ansible ansible-playbook playbook.yml -i testX --limit ansible1


## Author Information

  - Bent Kirkegaard Nielsen

