# nullkomma ⚡️❄️

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

Opinionated 🤓,
batteries-included 🔋,
extra-[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) 🤌
[Nix](https://nixos.org) ❄️ boilerplate.

> nullkommanix [ɪn ˈnʊl ˌkɔma ˈnɪçt͡s] noun German colloquialism (translation: in next to time).

## Installing

> [!NOTE]
> This is the software you need to have on your *system*.
> All project-specific software is handled automatically.

1. Install Nix (the package manager).
    The [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer) is recommended.
2. Install [direnv](https://direnv.net).
3. (optional) Install
    [nix-direnv](https://github.com/nix-community/nix-direnv)
    for better performance during development.
4. (if not already done) Clone the repo
5. (one-time only) Inside the repo, run `direnv allow`

> [!TIP]
> Windows is not supported by Nix,
> but you can use the
> [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install).

## Building

All build-targets are self-documented:

```sh
make help
```

## Updating

### Nix

There are two separate aspects to updating the nix dependencies.

1. There may be newer versions available *given* the pinning in `flake.nix`.
    This can be accomplished by running `make update-flake` locally and may change the `flake.lock`.
    However such updates may break a project.
    It is therefore recommended **to only run this in CI**,
    using the periodically scheduled `nix_maintenance.yml` job.
    It will automatically open pull requests if there are updates available.
    Users can then inspect whether the updated project still passes all tests.
2. The versions pinned in `flake.nix` (and the resulting `flake.lock`) itself may be out of date.
    The [DeterminateSystems/flake-checker](https://github.com/DeterminateSystems/flake-checker) will fail if this is the case.
    It runs on every push as well as periodically.
    You can also run this locally using `make check-flake-checker`.

### Development Shell

To bring the shell you are working in up to date with the *source* 
(`nix.flake`, etc.)
of your repository:

```sh
direnv reload
```
