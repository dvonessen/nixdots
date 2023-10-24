{pkgs, ...}: {
  home.packages = with pkgs; [
    kube-linter
    kubectl
    kubectx
    kubernetes-helm
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
