# BreezeX RosePine for Hyprcursor

Based on:

- https://github.com/ful1e5/BreezeX_Cursor
- https://github.com/rose-pine/cursor

Only useable with the new [Hyprcursor](https://github.com/hyprwm/hyprcursor) library. For more details, check out Vaxry's [blog post](https://blog.vaxry.net/articles/2024-cursors) on the new cursor project.

## 🏗️ Usage

1. Extract to `~/.local/share/icons`
2. Add `env = HYPRCURSOR_THEME,rose-pine-cursor-hyprcursor` to your hyprland config

### ❄ Nix

1. Copy `default.nix` derivation into your project
2. Import it in your `configuration.nix`

```nix
{ lib, inputs, pkgs, ... }:
let
  rose-pine-cursor-hyprcursor = pkgs.callPackage ../../packages/rose-pine-cursor-hyprcursor/default.nix { };
in
{
  environment.systemPackages = [
    rose-pine-cursor-hyprcursor
  };
}
```

3. Add env var to your hyprland config

```
env = HYPRCURSOR_THEME,rose-pine-cursor-hyprcursor
```

## 🖼️ Gallery

![Cursor showcase](https://github.com/rose-pine/cursor/assets/44733677/0c4f6823-48d5-4ec1-8e1c-201b22463ea1)

![Dawn cursor showcase](https://github.com/rose-pine/cursor/assets/44733677/18272dae-5ad7-4ed0-9916-9ad2715347bf)

## 📝 License

MIT
