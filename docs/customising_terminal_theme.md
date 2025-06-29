# Setting up terminal Theme
- Install fonts
    - mkdir -p ~/.fonts
    - `curl -L -o ~/3270.zip   https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/3270.zip`
    - `unzip ~/3270.zip -d ~/.fonts/`
    - `fc-cache -fv`
- `brew install starship`
- Add Starship to path
```bash
    echo >> /home/os161/.bashrc
    echo 'eval "$(starship init bash)"' >> /home/os161/.bashrc
    eval "$(starship init bash)"
```
- Add below in `~/.bashrc`
  - `eval "$(starship init bash)"`
- `source ~/.bashrc`
- Install Presets as per your liking
  - `starship preset gruvbox-rainbow -o ~/.config/starship.toml`
  - `exec $SHELL`