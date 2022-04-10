# ~/.config/nixpkgs/config.nix
{
    # https://nixos.wiki/wiki/FAQ/How_can_I_install_a_proprietary_or_unfree_package%3F
    allowUnfree = true;

    # https://github.com/NixOS/nixpkgs/issues/158956
    permittedInsecurePackages = [
        #"electron-13.6.9"
    ];

    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball {
        # Get the revision by choosing a version from https://github.com/nix-community/NUR/commits/master
        url = "https://github.com/nix-community/NUR/archive/17d2a5097fba459df1e5622138f4d81e55223f52.tar.gz";
        # Get the hash by running `nix-prefetch-url --unpack <url>` on the above url
        sha256 = "0xqpbgqzpmsvrjj45ip7a1aspafvr74xw4yfpbkp40a914gmknp1";
      }) {
        inherit pkgs;
      };
    };
}
