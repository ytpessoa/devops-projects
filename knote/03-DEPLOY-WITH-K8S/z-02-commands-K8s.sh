

# 1 - Creating a local Kubernetes cluster
# - Install "kubectl"
# - Install Minikube

$ minikube delete
$ minikube start

$ kubectl cluster-info
 kubectl cluster-info
# Kubernetes master is running at https://192.168.99.102:8443
# KubeDNS is running at https://192.168.99.102:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

#To further debug and diagnose cluster problems:
kubectl cluster-info dump


# 2 - Defining a Deployment
# Na raiz da aplicação:
mkdir  knote-and-mongo-YAMLS-k8s/


#3- Criar Deployment: deployment.yaml
kubectl explain deployment
kubectl explain deployment.spec.replicas

# 4- Criar Services:

# Pro tip: descobrir os tipos de Services(ClusterIP, LoadBalancer etc) disponíveis:
kubectl explain service.spec.type.


#Executando todos os arquivos YAMLs:
kubectl apply -f knote-k8S-YAMLS/
kubectl get pods --watch

kubectl get pods -n default
# NAME                         READY   STATUS    RESTARTS   AGE
# knote-67c9f46589-qvbxp   1/1     Running   0          3m11s
# mongo-8456bbdcb7-9hw9c   1/1     Running   0          3m11s
kubectl get services
# NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# knote    LoadBalancer   10.109.208.5   <pending>     80:31171/TCP   4m3s
# mongo    ClusterIP      10.98.171.46   <none>        27017/TCP      4m3s
# kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        13d

# Acessando o Service "knote"
minikube service knote
# |-----------|-----------|-------------|-----------------------------|
# | NAMESPACE |   NAME    | TARGET PORT |             URL             |
# |-----------|-----------|-------------|-----------------------------|
# | default   | knote |             | http://192.168.99.100:31171 |
# |-----------|-----------|-------------|-----------------------------|
# Opening service default/knote in default browser...


# The End:
kubectl delete -f knote-k8S-YAMLS/