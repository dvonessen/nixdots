{pkgs, config, ...}: {
  home.file = {
    lf-fzf-preview = {
      enable = true;
      executable = true;
      target = ".config/lf/preview.sh";
      source = ./lf-fzf/preview.sh;
    };
    lf-icons = {
      enable = true;
      target = ".config/lf/icons";
      source = ./lf-fzf/icons;
    };
  };

  home.packages = with pkgs; [
    bat
    glow
    gnutar
    xz
    unzip
    gzip
    unrar
    p7zip
    libcdio
    odt2txt
    catdoc
    python311Packages.docx2txt
    w3m
    exiftool
    poppler_utils
    ffmpegthumbnailer
    imagemagick
    coreutils
    chafa # CLI image renderer
    trash-cli # Toss files/folders into the xdg trash
    archiver # Universal archiver written in golang
    vimv-rs
  ];

  programs = {
    lf = {
      enable = true;
      previewer.source = "${config.home.homeDirectory}/${config.home.file.lf-fzf-preview.target}";
      settings = {
        shell = "zsh";
        drawbox = true;
        dupfilefmt = "%b.%n%e";
        icons = true;
        ignorecase = true;
        info = "size";
        relativenumber = true;
        scrolloff = 10;
        sixel = true;
        anchorfind = false;
        findlen = 1;
        cursorpreviewfmt = "\033[7m";
      };
      commands = {
        # # # # # # # # # #
        # Custom commands #
        # # # # # # # # # #
        # Open text file always with $EDITOR
        open = ''
          ''${{
            case $(file --mime-type "$f" -bL) in
            text/*|application/json) $EDITOR "$f";;
            *) $OPENER "$f" ;;
            esac
          }}
        '';
        # Create a new directory
        mkdir = ''
          ''${{
            printf "Directory Name: "
            read ans
            mkdir "$ans"
          }}
        '';
        # Create a new file with default editor
        mkfile = ''
          ''${{
            printf "File Name: "
            read ans
            $EDITOR "$ans"
          }}
        '';
        # chmod file
        chmod = ''
          ''${{
            printf "Mode Bits: "
            read ans

            for file in "$fx"
            do
              chmod "$ans" "$file"
            done

            lf -remote 'send $id reload'
          }}
        '';
        # Bulk rename file(s)
        bulkrename = ''
          ''${{
            IFS=$(printf "\n\t")
            vimv $(printf $fx | tr "\n" " ")

            lf -remote "send $id load"
            lf -remote "send $id unselect"
          }}
        '';
        zoxide = ''
          %{{
            result="$(zoxide query --exclude $PWD $@ | sed 's/\\/\\\\/g;s/"/\\"/g')"
            lf -remote "send $id cd \"$result\""
          }}
        '';
        # Invoke zoxide -i to use fuzzy searching through its database
        zoxidei = ''
          ''${{
            result="$(zoxide query -i | sed 's/\\/\\\\/g;s/"/\\"/g')"
            lf -remote "send $id cd \"$result\""
          }}
        '';
        fzfJump = ''
          ''${{
            res="$(fzf --header='Jump to location')"
            if [ -n "$res" ]; then
              if [ -d "$res" ]; then
                cmd="cd"
              else
                cmd="select"
              fi
              res="$(printf '%s' "$res" | sed 's/\\/\\\\/g;s/"/\\"/g')"
              lf -remote "send $id $cmd \"$res\""
            fi
          }}
        '';
        fzfSearch = ''
          ''${{
            RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
            res="$(
              FZF_DEFAULT_COMMAND="$RG_PREFIX '''" \
                fzf --bind "change:reload:$RG_PREFIX {q} || true" \
                --ansi --header 'Search in files' \
                | cut -d':' -f1 | sed 's/\\/\\\\/g;s/"/\\"/g'
            )"
            [ -n "$res" ] && lf -remote "send $id select \"$res\""
          }}
        '';
        extractArchive = ''
          %{{
            IFS=$(printf "\n\t")
            for file in $fx; do
              arc unarchive "$file"
            done
          }}
        '';
        createArchive = ''
          %{{
            IFS=$(printf "\n\t")
            arc archive "$1" "$fx"
          }}
        '';
        # Trash-ClI bindings
        # trash items
        trashPut = ''
          ''${{
            IFS=$(printf "\n\t")
            # put items into array that we can count them
            files=()
            while read -r line; do
              files+=("$line");
            done <<< "$fx"

            # count how many items there are
            len=''${#files[@]}

            # confirm trashing
            if [[ ''$len == 1 ]]; then
              printf "trash '$fx'?"
            else
              printf "files to trash:\n"
              for file in "$files[@]"; do
                printf "- "$file"\n"
              done
              printf "trash $len items?"
            fi
            printf " [y/N] "

            # read answer
            read ans
            # make it lowercase
            ans=$(printf "$ans" | tr '[:upper:]' '[:lower:]')

            printf "\n"

            if [[ $ans == y ]]; then
              trash-put $(printf $fx | sed 's/\n/ /g')
              if [[ $len == 1 ]]; then
                printf "trashed '$files'\n"
              else
                printf "trashed $len items\n"
              fi
            else
              # needed to clear the bottom row
              printf "\n"
            fi
          }}
        '';
        # Undo trashed items
        trashRestore = ''
          ''${{
            export lf_trash_restore=true
            ids="$(
              printf "\n"              | \
              trash-restore                   | \
              awk '$1 ~ /^[0-9]+/ {print $0}' | \
              fzf --multi                     | \
              awk '{printf("%s%s", sep, $1); sep=","} END {print ""}')"
            printf $ids | trash-restore
            clear
          }}
        '';
        trashEmpty = ''
          ''${{
            clear
            trashed_files=$(trash-list)
            printf "%s" "$trashed_files" | head -n $(($lf_height - 2))
            printf "\n"
            printf "Enter old days: [0=all] "
            read ans
            if [ $ans -ge 0 ]; then
              trash-empty $ans
            fi
          }}
        '';
         trashList = ''
          !{{
            clear
            trashed_files=$(trash-list)
            printf "%s" "$trashed_files" | head -n $(($lf_height - 2))
            printf "\n"
          }}
        '';
        # Convert link to file
        linkToFile = ''
          ''${{
            IFS=$(printf "\n\t")
            for file in "$fx"; do
              cp --remove-destination $(readlink "$file") "$file"
            done
          }}
        '';
        togglePreview = ''
          %{{
            if [ "$lf_preview" = "true" ]; then
              lf -remote "send $id :set preview false; set ratios 1:5"
            else
              lf -remote "send $id :set preview true; set ratios 1:2:3"
            fi
          }}
        '';
        # # # # # # # # # # # # # # # #
        # Commands without keybinding #
        # # # # # # # # # # # # # # # #

        # Use eza to display stats for file in lower left corner
        on-select = ''
          &{{
            lf -remote "send $id set statfmt \"$(eza -ld --color=always "$f")\""
          }}
        '';

        # Redraw if possible
        on-redraw = ''
          %{{
            if [ $lf_width -le 90 ]; then
              lf -remote "send $id set ratios 1:2"
            else
              lf -remote "send $id set ratios 1:2:3"
            fi
          }}
        '';

        # Show current directory in window title
        on-cd = ''
          &{{
            # '&' commands run silently in background (which is what we want here),
            # but are not connected to stdout.
            # To make sure our escape sequence still reaches stdout we pipe it to /dev/tty
            printf "\033]0; $(pwd | sed "s|$HOME|~|")\007" > /dev/tty
          }}
        '';
      };
      keybindings = {
        # # # # # # # # # # # # # #
        # Unmap some keybindings  #
        # # # # # # # # # # # # # #
        m = null;
        n = null;
        "\"\'\"" = null;
        d = null;
        f = null;
        t = null;

        # # # # # # # # # # # # #
        # Map internal Commands #
        # # # # # # # # # # # # #
        c = "copy";
        x = "cut";
        DD = "delete";
        ff = "filter";
        H = "top";
        L = "bottom";
        J = ":updir; down; open";
        K = ":updir; up; open";
        "<c-R>" = "reload";
        "<c-C>" = "clear";
        "<c-U>" = "unselect";

        # Toggle hidden files
        "\".\"" = "set hidden!";

        # Map simple commands
        gd = "cd ~/Downloads";
        gD = "cd ~/Documents";
        gn = "cd ~/Nextcloud";
        gg = "cd ~/git";

        # # # # # # # # # # # # # # # #
        # Mappings to custom commands #
        # # # # # # # # # # # # # # # #
        "<enter>" = "open";
        e     = "open";
        o     = "open";
        md    = "mkdir";
        mf    = "mkfile";
        ch    = "chmod";
        R     = "bulkrename";
        mr    = "bulkrename";
        gt    = "push :zoxide<space>";
        # Invoke zoxide -i to use fuzzy searching through it database
        gi    = "zoxidei";
        fj    = "fzfJump";
        "'\"'" = ":fzfSearch";
        "<c-f>" = ":fzfSearch";
        fs    = ":fzfSearch";
        ax    = "extractArchive";
        ac    = "push :createArchive<space>";
        # Trash-ClI bindings
        # trash items
        td    = "trashPut";
        dd    = "trashPut";
        # Undo trashed items
        uu    = "trashRestore";
        tr    = "trashRestore";
        te    = "trashEmpty";
        tl    = "trashList";
        # Convert link to file
        dl    = "linkToFile";
        zp    = "togglePreview";
      };
      extraConfig = ''
        $mkdir -p ${config.xdg.cacheHome}/lf
        on-cd
      '';
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      defaultCommand = "${pkgs.fd}/bin/fd --type f";
      defaultOptions = [
        "--preview '${config.home.homeDirectory}/${config.home.file.lf-fzf-preview.target} {}'"
        "--cycle"
        "--border=bold"
      ];
    };
  };
}
