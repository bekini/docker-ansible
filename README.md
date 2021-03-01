# docker-ansible


https://medium.com/@iced_burn/run-ansible-with-docker-9eb27d75285b
https://github.com/spy86/docker-ansible

ansible dir: /home/bekini/ansible/test_docker_ansible
ansible docker: ~/docker/ansible


Ansible test host should be running to have ssh connect set up

Add ansible test hosts to .ssh/config

create a ssh private key for ansible and copy it to /root/.ssh/id_rsa

copy public key to ansible test hosts






# ---- 
bekini@w540:~/ansible/test_docker_ansible$ docker run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles -v ~/.ssh:/root/.ssh:ro --rm spy86/ansible:latest ansible-playbook playbook.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

