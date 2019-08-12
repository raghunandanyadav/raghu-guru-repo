#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating www.raghu-guru$i container.."
    sleep 1
    docker run --name www.raghu-guru$i -d -it raghu/raghu-guru-img /bin/bash
    echo "www.raghu-guru$i container has been created!"
	echo "=============================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -q` > IPs.txt
./create_lb.sh
