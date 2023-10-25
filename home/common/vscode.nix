{pkgs, ...}: {
  home.packages = with pkgs; [
    shellcheck # Used for shellcheck vscode extension
    nixd # nix language server
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-marketplace; [
      alefragnani.project-manager
      christian-kohler.path-intellisense
      davidanson.vscode-markdownlint
      donjayamanne.githistory
      eamodio.gitlens
      exiasr.hadolint
      file-icons.file-icons
      foxundermoon.shell-format
      gitlab.gitlab-workflow
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-python.python
      ms-python.vscode-pylance
      ms-vscode.live-server
      rlnt.keep-a-changelog
      ryanluker.vscode-coverage-gutters
      streetsidesoftware.code-spell-checker
      streetsidesoftware.code-spell-checker-german
      timonwong.shellcheck
      visualstudioexptteam.intellicode-api-usage-examples
      visualstudioexptteam.vscodeintellicode
      visualstudioexptteam.vscodeintellicode-completions
      vivaxy.vscode-conventional-commits
      yzhang.markdown-all-in-one
    ];
    keybindings = [
      {
        key = "shift+cmd+numpad_add";
        command = "editor.action.fontZoomIn";
      }
      {
        key = "shift+cmd+numpad_subtract";
        command = "editor.action.fontZoomOut";
      }
      {
        key = "shift+cmd+numpad0";
        command = "editor.action.fontZoomReset";
      }
      {
        key = "cmd+numpad_add";
        command = "workbench.action.zoomIn";
      }
      {
        key = "cmd+numpad_add";
        command = "-workbench.action.zoomIn";
      }
      {
        key = "alt+cmd+n";
        command = "explorer.newFolder";
      }
      {
        key = "shift+cmd+7";
        command = "-coverage-gutters.displayCoverage";
      }
      {
        key = "shift+alt+t";
        command = "terminal.focus";
      }
      {
        key = "alt+cmd+p";
        command = "projectManager.listProjectsNewWindow";
      }
    ];
    userSettings = {
      "window.commandCenter" = "true";
      "gtkTitleBar.mode" = "dark";
      "files.autoSave" = "onFocusChange";
      "editor.bracketPairColorization.enabled" = "true";
      "editor.copyWithSyntaxHighlighting" = false;
      "editor.letterSpacing" = 0.25;
      "editor.linkedEditing" = "true";
      "editor.mouseWheelScrollSensitivity" = 0.75;
      "editor.mouseWheelZoom" = "true";
      "editor.parameterHints.cycle" = "true";
      "editor.renderLineHighlight" = "all";
      "editor.renderWhitespace" = "boundary";
      "editor.rulers" = [
        79
        119
        139
      ];
      "editor.inlineSuggest.enabled" = "true";
      "python.linting.flake8Path" = "flake8";
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'UbuntuMono Nerd Font', 'RobotoMono Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = "true";
      "editor.scrollbar.horizontalScrollbarSize" = 14;
      "editor.showFoldingControls" = "always";
      "editor.cursorWidth" = 1;
      "editor.fontSize" = 12;
      "editor.formatOnSaveMode" = "file";
      "editor.minimap.showSlider" = "always";
      "files.eol" = "\n";
      "files.hotExit" = "onExitAndWindowClose";
      "files.insertFinalNewline" = "true";
      "files.trimFinalNewlines" = "true";
      "files.trimTrailingWhitespace" = "true";
      "workbench.commandPalette.preserveInput" = "true";
      "workbench.enableExperiments" = "false";
      "workbench.list.horizontalScrolling" = "true";
      "workbench.startupEditor" = "readme";
      "workbench.preferredDarkColorTheme" = "Default Dark+";
      "workbench.preferredLightColorTheme" = "Default Light+";
      "workbench.tree.renderIndentGuides" = "always";
      "workbench.view.alwaysShowHeaderActions" = "true";
      "workbench.editor.labelFormat" = "medium";
      "window.autoDetectColorScheme" = "true";
      "window.doubleClickIconToClose" = "true";
      "window.menuBarVisibility" = "toggle";
      "scm.alwaysShowActions" = "true";
      "scm.alwaysShowRepositories" = "true";
      "extensions.autoUpdate" = "false";
      "terminal.integrated.confirmOnExit" = "hasChildProcesses";
      "terminal.integrated.copyOnSelection" = "true";
      "terminal.integrated.scrollback" = 1000000;
      "update.mode" = "none";
      "telemetry.telemetryLevel" = "off";
      "security.workspace.trust.banner" = "never";
      "material-icon-theme.showUpdateMessage" = "true";
      "python.analysis.completeFunctionParens" = "true";
      "python.experiments.enabled" = "false";
      "redhat.telemetry.enabled" = "false";
      "vs-kubernetes" = {
        "vs-kubernetes.namespace" = "";
        "vs-kubernetes.minikube-path" = "";
        "vs-kubernetes.kubectlVersioning" = "user-provided";
        "vs-kubernetes.outputFormat" = "yaml";
        "vs-kubernetes.kubeconfig" = "";
        "vs-kubernetes.knownKubeconfigs" = [];
        "vs-kubernetes.autoCleanupOnDebugTerminate" = "false";
        "vs-kubernetes.nodejs-autodetect-remote-root" = "true";
        "vs-kubernetes.nodejs-remote-root" = "";
        "vs-kubernetes.nodejs-debug-port" = 9229;
        "vs-kubernetes.dotnet-vsdbg-path" = "~/vsdbg/vsdbg";
        "vs-kubernetes.local-tunnel-debug-provider" = "";
        "checkForMinikubeUpgrade" = "true";
        "imageBuildTool" = "Buildah";
        "vs-kubernetes.crd-code-completion" = "enabled";
      };
      "oneDarkPro.editorTheme" = "Gnome";
      "workbench.iconTheme" = "file-icons";
      "security.workspace.trust.untrustedFiles" = "open";
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "javascript.format.enable" = "false";
      "typescript.format.enable" = "false";
      "eslint.format.enable" = "true";
      "eslint.lintTask.enable" = "true";
      "editor.codeActionsOnSave" = {
        "source.fixAll" = "true";
      };
      "eslint.workingDirectories" = [
        {
          "mode" = "auto";
        }
      ];
      "[typescript]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };
      "workbench.editor.untitled.hint" = "hidden";
      "[yaml]" = {
        "editor.insertSpaces" = "true";
        "editor.tabSize" = 2;
        "editor.autoIndent" = "keep";
        "gitlens.codeLens.scopes" = [
          "document"
        ];
        "editor.quickSuggestions" = {
          "other" = "true";
          "comments" = "false";
          "strings" = "true";
        };
      };
      "sops.beta" = "true";
      "[dockerfile]" = {
        "editor.defaultFormatter" = "foxundermoon.shell-format";
      };
      "python.formatting.provider" = "black";
      "python.linting.enabled" = "true";
      "python.linting.lintOnSave" = "true";
      "[markdown]" = {
        "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
      };
      "autoDocstring.startOnNewLine" = "true";
      "projectManager.git.baseFolders" = [
        "~/git"
      ];
      "projectManager.git.maxDepthRecursion" = 10;
      "workbench.colorTheme" = "Default Dark+";
      "conventionalCommits.showNewVersionNotes" = "false";
      "gitlens.views.remotes.branches.layout" = "list";
      "git.suggestSmartCommit" = "false";
      "hediet.vscode-drawio.resizeImages" = "null";
      "gitlens.rebaseEditor.ordering" = "asc";
    };
  };
}
