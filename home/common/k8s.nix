{pkgs, ...}: {
  home.packages = with pkgs; [
    kubernetes-helm
    kube-linter
    kubectx
    kubectl
    kustomize
    minio-client
    stern
    velero
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
