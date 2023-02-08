# IMAGE_NAME=hassanaftab/my-angular-app
# DOCKERFILE_PATH=Docker/Dockerfile
NAMESPACE=kubernetes-dashboard
KUBERNETES_DASHBOARD_SETUP=https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml
KUBERNETES_PROXY=proxy
SECRET_NAME=vpnkit-controller-token-cpqmv

dashboard:
	kubectl create namespace $(NAMESPACE)
	kubectl apply -f $(KUBERNETES_DASHBOARD_SETUP) --namespace $(NAMESPACE)

	kubectl $(KUBERNETES_PROXY)

kubesecrets:
	kubectl -n kube-system get secret
	kubectl -n kube-system describe secret $(SECRET_NAME)

kubelogin:
	http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

kubedelete:
	kubectl delete -f $(KUBERNETES_DASHBOARD_SETUP) --namespace $(NAMESPACE)

logs:
	kubectl logs -f $(shell kubectl get pods -n $(NAMESPACE) -l app=kubernetes-dashboard -o jsonpath='{.items[0].metadata.name}') --namespace $(NAMESPACE)
	
.PHONY: dashboard kubesecrets kubelogin kubedelete logs