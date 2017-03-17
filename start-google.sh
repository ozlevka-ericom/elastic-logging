#! /bin/bash
yum -y update
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum -y install docker-engine
systemctl enable docker.service
systemctl start docker
usermod -aG docker ozlevka
sysctl -w vm.max_map_count=262144





#! /bin/bash
yum -y update
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum -y install docker-engine
systemctl enable docker.service
systemctl start docker
usermod -aG docker ozlevka
sysctl -w vm.max_map_count=262144
mkdir /home/ozlevka/data
chown ozlevka:ozlevka /home/ozlevka/data
#docker run -d --network host -e ES_HEAP_SIZE=2g elasticsearch:2.4.2 elasticsearch -Des.cluster.name=gce -Des.node.master=false -Des.node.data=true -Des.discovery.zen.ping.unicast.hosts="10.240.0.2"
docker run -d --network host -e 'ES_JAVA_OPTS=-Xms2g -Xmx2g' -v /home/ozlevka/data:/usr/share/elasticsearch/data elasticsearch:5.1.2 --E cluster.name=gce --E node.data=true --E node.master=false --E node.max_local_storage_nodes=6 --E discovery.zen.ping.unicast.hosts="10.240.0.2" --E network.host=_site_