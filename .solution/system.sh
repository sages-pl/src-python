#!/bin/bash
set -e
set -x

git clone https://github.com/sages-pl/src-python.git
ln -s /home/ubuntu/src-python /home/ubuntu/src
cd /home/ubuntu/src

echo 'export IP=$(curl -s ipecho.net/plain)' >> ~/.bashrc
echo 'export PATH=/home/ubuntu/bin:$PATH' >> ~/.bashrc
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> ~/.bashrc
source "~/.bashrc"

sudo apt update
sudo apt install -y uidmap docker-buildx
curl https://get.docker.com/rootless |sh -x
systemctl --user enable docker
sudo loginctl enable-linger $(whoami)
docker network create ecosystem

cat > ~/bin/run-gitea << EOF

docker run \\
    --name gitea \\
    --detach \\
    --restart unless-stopped \\
    --env USER_UID=1000 \\
    --env USER_GID=1000 \\
    --env GITEA__server__ROOT_URL=http://$IP:3000/ \\
    --env GITEA__database__DB_TYPE=sqlite3 \\
    --env GITEA__database__PATH=/var/lib/gitea/data/gitea.db \\
    --env GITEA__database__HOST=... \\
    --env GITEA__database__NAME=... \\
    --env GITEA__database__USER=... \\
    --env GITEA__database__PASSWD=... \\
    --dns 8.8.8.8 \\
    --network ecosystem \\
    --publish 3000:3000 \\
    --publish 2222:22 \\
    --volume gitea_data:/var/lib/gitea \\
    --volume gitea_config:/etc/gitea \\
    --volume /etc/timezone:/etc/timezone:ro \\
    --volume /etc/localtime:/etc/localtime:ro \\
    gitea/gitea:latest-rootless

echo "Gitea running on: http://$IP:3000/"

EOF

cat > ~/bin/run-jenkins << EOF

docker run \\
    --name jenkins \\
    --detach \\
    --network ecosystem \\
    --restart unless-stopped \\
    --publish 8080:8080 \\
    --volume jenkins_data:/var/jenkins_home \\
    --volume /run/user/1000/docker.sock:/var/run/docker.sock \\
    jenkins/jenkins:lts-alpine

docker exec -u root jenkins apk add python3 py3-pip
docker exec -u root jenkins apk add docker

chmod o+rw /run/user/1000/docker.sock
sudo ln -s /home/ubuntu/.local/share/docker/volumes/jenkins_data/_data/ /var/jenkins_home
mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old

echo "Jenkins running on: http://$IP:8080/"

EOF

cat > ~/bin/run-sonarqube << EOF

docker run \\
    --name sonarqube \\
    --detach \\
    --restart unless-stopped \\
    --network ecosystem \\
    --publish 9000:9000 \\
    --volume sonarqube_data:/opt/sonarqube/data \\
    --volume sonarqube_logs:/opt/sonarqube/logs \\
    --volume sonarqube_extensions:/opt/sonarqube/extensions \\
    sonarqube:community

echo "SonarQube running on: http://$IP:9000/"

EOF

cat > ~/bin/run-registry << EOF

docker run \\
    --detach \\
    --restart unless-stopped \\
    --name registry \\
    --network ecosystem \\
    --publish 5000:5000 \\
    --volume registry_data:/var/lib/registry \\
    registry:latest

echo "Registry running on: http://$IP:5000/"

EOF

cat > ~/registry-ui.yml << EOF

listen_addr: 0.0.0.0:8888
base_path: /

registry_url: http://registry:5000
verify_tls: true

# registry_username: user
# registry_password: pass

# The same one should be configured on Docker registry as Authorization Bearer token.
event_listener_token: token
event_retention_days: 7

event_database_driver: sqlite3
event_database_location: data/registry_events.db
# event_database_driver: mysql
# event_database_location: user:password@tcp(localhost:3306)/docker_events

cache_refresh_interval: 10

# If users can delete tags.
# If set to False, then only admins listed below.
anyone_can_delete: false

# Users allowed to delete tags.
# This should be sent via X-WEBAUTH-USER header from your proxy.
admins: []

# Debug mode. Affects only templates.
debug: true

# How many days to keep tags but also keep the minimal count provided no matter how old.
purge_tags_keep_days: 90
purge_tags_keep_count: 2

EOF

cat > ~/bin/run-registryui << EOF

docker run \\
    --name registry-ui \\
    --detach \\
    --restart unless-stopped \\
    --network ecosystem \\
    --publish 8888:8888 \\
    --volume /home/ubuntu/registry-ui.yml:/opt/config.yml:ro \\
    quiq/docker-registry-ui:latest

echo "Registry UI running on: http://$IP:8888/"

EOF
