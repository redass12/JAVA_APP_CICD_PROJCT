echo "exécution du healthcheck, peut prendre un certain temps"
sleep 120
kubectl run curl --image=curlimages/curl -i --rm --restart=Never -- curl myjavaapp-myapp:8080

if [ $? -eq 0 ]
then
 echo "Le déploiement est réussi...La santé de l\`application est en bonne santé"
else
  helm rollback myjavaapp 
fi
