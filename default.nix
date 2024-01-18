with (import <nixpkgs> {});
with pkgs; [ nodejs ]
rec {
    muellshack = mkYarnPackage {
        name = "bespoke_automata";
        src = ./.;
        packageJSON = ./package.json;
        yarnLock = ./yarn.lock;
        yarnNix = ./yarn.nix;
    };
}
