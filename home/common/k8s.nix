{pkgs, ...}: {
  home.packages = with pkgs; [
    argocd
    kube-linter
    kubectl
    kubectx
    kubernetes-helm
    kustomize
    minio-client
    sops
    stern
    velero
    dive
    authelia
  ];

  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        enableMouse = true;
      };
    };
  };
}
