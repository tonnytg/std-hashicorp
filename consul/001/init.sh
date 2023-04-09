mkdir -p /var/lib/consul
mkdir -p /etc/consul.d
export C_IP=`ifconfig eth0 | grep inet | awk '{print $2}' | cut -d':' -f2`
export C_NODE_NAME="$(hostname -s)"
consul agent -server -bootstrap-expect=3 -node=${C_NODE_NAME} -bind=${C_IP} -data-dir=/var/lib/consul -config-dir=/etc/consul.d

docker exec -it consulserver01 sh
docker exec -it consulserver02 sh
docker exec -it consulserver03 sh

# After run you need make join server
