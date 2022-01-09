##this script increase 13 

 cd /home/zisoft/deployments/ibm &&
 docker-compose down && 
 git checkout IBM && 
 git reset --hard &&
 git pull &&
 rm -f .env &&
 cp .env.example .env && 
 sed -i '/80:80/d' docker-compose.yml &&
 sed -i 's/443:443/16022:443/g' docker-compose.yml &&
 sed -i 's/8810:8810/8923:8810/g' docker-compose.yml && 
 sed -i 's/8810/8923/g' .env && 
 sed -i 's/8810/8923/g' ui/src/main.ts && 
 sed -i 's/localhost/ibm.iep.firmcom.net/g' server/default.conf &&
 sed -i 's/VEP/IBM/g' docker-compose.yml &&
 rm -f /home/zisoft/deployments/ibm/server/cert.pem && 
 rm -f /home/zisoft/deployments/ibm/server/key.pem &&
 rm -f /home/zisoft/deployments/ibm/addons/notificationserver/sslcert/cert.pem && 
 rm -f /home/zisoft/deployments/ibm/addons/notificationserver/sslcert/key.pem &&
 cp /etc/letsencrypt/live/ibm.iep.firmcom.net/cert.pem /home/zisoft/deployments/ibm/server/ &&
 cp /etc/letsencrypt/live/ibm.iep.firmcom.net/privkey.pem /home/zisoft/deployments/ibm/server/key.pem &&
 cp /etc/letsencrypt/live/ibm.iep.firmcom.net/cert.pem /home/zisoft/deployments/ibm/addons/notificationserver/sslcert/ && 
 cp /etc/letsencrypt/live/ibm.iep.firmcom.net/privkey.pem /home/zisoft/deployments/ibm/addons/notificationserver/sslcert/key.pem &&
 bash update.sh && 
#cd admin
 chmod -R 777 storage/logs  && 
 chmod -R 777 storage/framework &&
 chmod -R 777 ui/dist &&
 chmod -R 777 admin/dist &&
 chmod -R 777 bootstrap &&
 chmod -R 777 storage/app &&

 docker-compose down &&
 docker-compose up -d
#docker stack deploy -c "docker-compose.yml" ibm
