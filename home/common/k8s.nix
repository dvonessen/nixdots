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
  ];

  programs.k9s = {
    enable = true;
    # Commented until: https://github.com/derailed/k9s/issues/2346
    # settings = {
    #   k9s = {
    #     enableMouse = true;
    #   };
    # };
  };
}
