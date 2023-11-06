{pkgs, ...}: {
    home.packages = with pkgs; [
        inkscape
        hunspellDicts.de_DE
        hunspellDicts.de-de
        spotify
    ];
}
