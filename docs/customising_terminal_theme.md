# Setting up terminal Theme
- `brew install starship`
- Add below in `~/.bashrc`
  - `eval "$(starship init bash)"`
- `source ~/.bashrc`
- Install Presets as per your liking
  - `starship preset gruvbox-rainbow -o ~/.config/starship.toml`
  - `exec $SHELL`