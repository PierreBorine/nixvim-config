nixvim-config
=============
#### My Nixvim configuration

<div align="center"><img src=".github/assets/screenshot.png" alt="nvim"></div>

## Usage
### Run without installing
```Shell
nix run github:PierreBorine/nixvim-config
```

### Flake
Import this flake into your's
```nix
# flake.nix
{
  inputs = {
    nixvim-config.url = "github:PierreBorine/nixvim-config";
    # optional, the choice is yours:
    # Decreases your system's closure size at
    # the cost of build time if using the cachix.
    nixvim-config.inputs.nixpkgs.follows = "nixpkgs";
  };
}
```
If you want to reduce build time, you can add my cachix.
```nix
# configuration.nix
{
  nix.settings = {
    substituters = [
      "https://pierreborine.cachix.org"
    ];
    trusted-public-keys = [
      "pierreborine.cachix.org-1:D6WNCFqd5FZkTMem+QF+q25/lU2KFf8C7zBvvzhZZAk="
    ];
  };
}
```
Access the package like this
```nix
# configuration.nix
{inputs, pkgs, lib, ...}: {
  # With default settings
  environment.systemPackages = [inputs.nixvim-config.packages.${pkgs.stdenv.hostPlatform.system}.default];

  # Recommended:
  # With some settings
  environment.systemPackages = let
    nvim = inputs.nixvim-config.lib.mkNvim {
      inherit (pkgs.stdenv.hostPlatform) system; # mandatory
      # Used to get the flake's options (inputs.self) for the Nix LSP
      # default: null
      inherit inputs;
      # Whether to install and enable wakatime
      # default: false
      wakatime = true;
      # Whether to enable 42 School related options
      # Stdheader, norm formatter
      # default: null
      life = 42;
      # Whether to have transparent background
      # by default. Can toggle with :TransparencyToggle
      # default: false
      transparent = false;
      # Which languages to support.
      # either "All" or a list, available options:
      # ["Nix" "C" "Rust" "QML" "Python" "CS" "Web" "Haskell"]
      # default: []
      languages = "All";
      # Whether to disable some dependencies.
      # Usefull to reduce closure size.
      # default = false
      portable = true;
      # Extra Nixvim config.
      # See official documentation.
      config = {
        plugins = {
          smear-cursor.enable = true;
          hardtime.settings.enabled = true;
        };
        opts.wrap = lib.mkForce false;
      };
    };
  in [nvim];
}
```
