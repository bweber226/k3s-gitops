# k3s GitOps

ArgoCD-managed GitOps repository for k3s homelab cluster.

## Structure

- `bootstrap/` - One-time manual setup (ArgoCD install)
- `apps/` - Helm values and config for each application
- `argocd/` - ArgoCD Application manifests

## Bootstrap Order

1. Install ArgoCD manually from bootstrap/
2. Apply App of Apps manifest
3. ArgoCD manages everything else from Git