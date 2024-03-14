# rose-pine-hyprcursor

![AUR Version](https://img.shields.io/aur/version/rose-pine-hyprcursor?style=for-the-badge&logo=archlinux&logoColor=white&labelColor=black&color=black)
![AUR Maintainer](https://img.shields.io/aur/maintainer/rose-pine-hyprcursor?style=for-the-badge&labelColor=black&color=black)
![AUR Last Modified](https://img.shields.io/aur/last-modified/rose-pine-hyprcursor?style=for-the-badge&labelColor=black&color=black)

![Cursor showcase](https://github.com/rose-pine/cursor/assets/44733677/0c4f6823-48d5-4ec1-8e1c-201b22463ea1)

> [!NOTE]
> This only includes [the "dark" version](https://github.com/rose-pine/cursor#gallery) of the original Rose Pine BreezeX cursor theme. The uncompressed cursor SVG's are included in the `hyprcursor_uncompressed` directory if you want to make any changes to the SVG's.

This is a [Rose Pine](https://github.com/rose-pine/cursor) remix of the original [BreezeX](https://github.com/ful1e5/BreezeX_Cursor) cursor theme. Then repackaged again for use with Hyprland's new [Hyprcursor format](https://blog.vaxry.net/articles/2024-cursors).

## 🏗️ Installation

> **Only useable with Hyprland with the new [Hyprcursor](https://github.com/hyprwm/hyprcursor) packaging format**

### Manual

1. Extract to `~/.local/share/icons`

### Arch

1. Install from the [AUR](https://aur.archlinux.org/packages/rose-pine-hyprcursor)

```bash
yay -S rose-pine-hyprcursor
```

### Nix

1. Add us to your `flake.nix` inputs

```nix
{
  description = "Laptop Machine Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/hyprland?ref=v0.36.0";

    # Add this line
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    # ^^^^^
  };
  outputs = { self, unstable, nixpkgs, ... } @inputs: {
  nixosConfigurations = {
    laptop01 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop01/configuration.nix
      ];
    };
  };
}
```

## ⚒️ Usage

Add the `HYPRCURSOR_THEME` environment variable to your `hyprland` config

```
env = HYPRCURSOR_THEME,rose-pine-hyprcursor
```

## 🛟 Troubleshooting

1. If the theme isn't loading for whatever reason, make sure it is available in one of the valid icon paths, for example:

- `/usr/share/icons/rose-pine-hyprcursor`
- `~/.local/share/icons/rose-pine-hyprcursor`

2. You can also [enable `debug` logging](https://wiki.hyprland.org/Configuring/Variables/#debug) in Hyprland to see if there's any helpful information there

```hyprlang
debug {
  debug_logs = true
}
```

Or with Nix

```nix
hyprland.override {
  debug = true;
};
```

## 🤝 Contributing

Open to all contributions!

This is originally based upon the work in the following two repositories.

- https://github.com/ful1e5/BreezeX_Cursor
- https://github.com/rose-pine/cursor

## 📝 License

MIT
