{config, ...}: {
  home.file."docker-settings-json" = {
    enable = true;
    target = "${config.home.homeDirectory}/Library/Group Containers/group.com.docker/settings.json";
    text = ''
      {
        "acceptCanaryUpdates": false,
        "activeOrganizationName": "",
        "allowExperimentalFeatures": true,
        "analyticsEnabled": true,
        "authDeclinedInstallSettings": false,
        "autoDownloadUpdates": false,
        "autoPauseTimedActivitySeconds": 30,
        "autoPauseTimeoutSeconds": 300,
        "autoStart": false,
        "backupData": false,
        "containerTerminal": "integrated",
        "cpus": 10,
        "credentialHelper": "docker-credential-osxkeychain",
        "customWslDistroDir": "",
        "dataFolder": "${config.home.homeDirectory}/Library/Containers/com.docker.docker/Data/vms/0/data",
        "deprecatedCgroupv1": false,
        "disableHardwareAcceleration": false,
        "disableUpdate": true,
        "diskFlush": "",
        "diskQcowCompactAfter": 0,
        "diskQcowKeepErased": 0,
        "diskQcowRuntimeAsserts": false,
        "diskSizeMiB": 61035,
        "diskStats": "",
        "diskTRIM": true,
        "displayRestartDialog": true,
        "displayedDeprecate1014": false,
        "displayedElectronPopup": [],
        "displayedOnboarding": true,
        "dockerAppLaunchPath": "",
        "dockerBinInstallPath": "system",
        "enableDefaultDockerSocket": true,
        "enableIntegrityCheck": true,
        "enableSegmentDebug": false,
        "enableWasmShims": false,
        "enhancedContainerIsolation": false,
        "exposeDockerAPIOnTCP2375": false,
        "extensionsEnabled": true,
        "extensionsPrivateMarketplace": false,
        "filesharingDirectories": [
          "/Users",
          "/Volumes",
          "/private",
          "/tmp",
          "/var/folders"
        ],
        "kernelForUDP": false,
        "kubernetesEnabled": false,
        "kubernetesInitialInstallPerformed": false,
        "lastLoginDate": 0,
        "latestBannerKey": "",
        "licenseTermsVersion": 2,
        "lifecycleTimeoutSeconds": 600,
        "memoryMiB": 16384,
        "networkType": "gvisor",
        "noWindowsContainers": false,
        "onlyMarketplaceExtensions": false,
        "openUIOnStartupDisabled": true,
        "overrideProxyExclude": "",
        "overrideProxyHttp": "",
        "overrideProxyHttps": "",
        "overrideWindowsDockerdPort": -1,
        "proxyHttpMode": "system",
        "requireVmnetd": true,
        "runWinServiceInWslMode": false,
        "settingsVersion": 34,
        "showBuildsViewFeature": true,
        "showExtensionsSystemContainers": false,
        "showKubernetesSystemContainers": false,
        "showMacInstall": false,
        "socksProxyPort": 0,
        "swapMiB": 0,
        "themeSource": "system",
        "updateAvailableTime": 0,
        "updateHostsFile": false,
        "updateInstallTime": 0,
        "useBackgroundIndexing": true,
        "useContainerdSnapshotter": false,
        "useCredentialHelper": true,
        "useGrpcfuse": true,
        "useNightlyBuildUpdates": false,
        "useResourceSaver": true,
        "useVirtualizationFramework": true,
        "useVirtualizationFrameworkRosetta": false,
        "useVirtualizationFrameworkVirtioFS": true,
        "useVpnkit": true,
        "useWindowsContainers": false,
        "vpnKitAllowedBindAddresses": "0.0.0.0",
        "vpnKitMTU": 1500,
        "vpnKitMaxConnections": 2000,
        "vpnKitMaxPortIdleTime": 300,
        "vpnKitTransparentProxy": true,
        "vpnkitCIDR": "192.168.65.0/24",
        "wslEnableGrpcfuse": false,
        "wslEngineEnabled": false
      }
    '';
  };
}
