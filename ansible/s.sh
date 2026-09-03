
!/bin/bash

ansible-playbook -i inventory/development.ini playbooks/common.yml  
ansible-playbook -i inventory/staging.ini playbooks/common.yml 
ansible-playbook -i inventory/production.ini playbooks/common.yml 


ansible-playbook -i inventory/development.ini playbooks/nginx.yml 
ansible-playbook -i inventory/staging.ini playbooks/nginx.yml 
ansible-playbook -i inventory/production.ini playbooks/nginx.yml 

export RELEASE_ID=$(date +%Y%m%d%H%M%S)

ansible-playbook -i inventory/development.ini playbooks/deploy.yml -e "artifact_path=/home/zohaib/devops/course-2/restaurant-web-app/dist"   -e "release_id=$RELEASE_ID" 

export RELEASE_ID=$(date +%Y%m%d%H%M%S)

ansible-playbook -i inventory/staging.ini playbooks/deploy.yml -e "artifact_path=/home/zohaib/devops/course-2/restaurant-web-app/dist"   -e "release_id=$RELEASE_ID" 

export RELEASE_ID=$(date +%Y%m%d%H%M%S)

ansible-playbook -i inventory/production.ini playbooks/deploy.yml -e "artifact_path=/home/zohaib/devops/course-2/restaurant-web-app/dist"   -e "release_id=$RELEASE_ID" 



















# #!/bin/bash

# ansible-playbook -i inventory/development.ini playbooks/common.yml --become --ask-become-pass
# ansible-playbook -i inventory/development.ini playbooks/nginx.yml --become --ask-become-pass
# export RELEASE_ID=$(date +%Y%m%d%H%M%S)
# ansible-playbook -i inventory/development.ini playbooks/deploy.yml  --become --ask-become-pass  -e "artifact_path=/home/zohaib/devops/course-2/restaurant-web-app/dist"   -e "release_id=$RELEASE_ID" 

