# Homebrew tap for Agentdesktop

[Agentdesktop](https://github.com/agentdesktop-dev/agentdesktop) is an open-source
visibility and management layer for AI tools across a desktop fleet.

## Install

### macOS (desktop app, daemon, and CLI)

```sh
brew install --cask agentdesktop-dev/agentdesktop/agentdesktop
```

This installs the notarized upstream PKG: `agentdesktop.app`, the
`dev.agentdesktop.daemon` LaunchDaemon, and the `agentdesktop` command. The
installer asks for an administrator password.

### Linux without a desktop (RHEL 8, WSL, VDI)

```sh
brew install agentdesktop-dev/agentdesktop/agentdesktop-headless
```

This installs the statically linked headless binary as `agentdesktop`. Create
`~/.config/agentdesktop/config.yaml` first, then run the daemon with
`brew services start agentdesktop-headless`. See `brew info agentdesktop-headless`.

Or `brew tap agentdesktop-dev/agentdesktop` and then install by name, or use a `Brewfile`:

```ruby
tap "agentdesktop-dev/agentdesktop"
cask "agentdesktop"             # macOS
brew "agentdesktop-headless"    # Linux
```

## Maintenance

The `brew bump` workflow opens a pull request daily when upstream publishes a new
release. To bump by hand:

```sh
brew bump-cask-pr --version <version> agentdesktop-dev/agentdesktop/agentdesktop
brew bump-formula-pr --version <version> agentdesktop-dev/agentdesktop/agentdesktop-headless
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
