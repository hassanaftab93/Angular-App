# IMAGE_NAME=hassanaftab/my-angular-app
# DOCKERFILE_PATH=Docker/Dockerfile
NAMESPACE=kubernetes-dashboard
KUBERNETES_DASHBOARD_SETUP=https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml
KUBERNETES_PROXY=proxy
SECRET_NAME=kubernetes-dashboard-certs

dashboard:
	kubectl create namespace $(NAMESPACE)
	kubectl apply -f $(KUBERNETES_DASHBOARD_SETUP) --namespace $(NAMESPACE)

kubesecrets:
	kubectl -n $(NAMESPACE) get secrets
	kubectl -n $(NAMESPACE) describe secret $(SECRET_NAME)

kubeproxy:
	kubectl $(KUBERNETES_PROXY)

kubelogin:
	echo http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

kubedelete:
	kubectl delete -f $(KUBERNETES_DASHBOARD_SETUP) --namespace $(NAMESPACE)

kubedeletens:
	kubectl delete namespace $(NAMESPACE)

logs:
	kubectl logs -f $(shell kubectl get pods -n $(NAMESPACE) -l app=kubernetes-dashboard -o jsonpath='{.items[0].metadata.name}') --namespace $(NAMESPACE)
	
.PHONY: dashboard kubesecrets kubeproxy kubelogin kubedelete kubedeletens logs