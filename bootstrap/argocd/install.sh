#!/bin/bash
set -e

echo "Adding ArgoCD Helm repo..."
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

echo "Creating ArgoCD namespace..."
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -

echo "Installing ArgoCD..."
helm install argocd argo/argo-cd \
  --namespace argocd \
  --values bootstrap/argocd/values.yml \
  --wait

echo "ArgoCD installed. Getting initial admin password..."
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
echo ""

echo "Done. Access ArgoCD UI with:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"