_zsh_nvm_has() {
  type "$1" > /dev/null 2>&1
}

_zsh_nvm_get() {
  if _zsh_nvm_has "curl"; then
    curl --silent "$1"
  elif _zsh_nvm_has "wget"; then
    wget --quiet --output-document - "$1"
  fi
}

_zsh_nvm_latest_release_tag() {
  _zsh_nvm_get "https://api.github.com/repos/creationix/nvm/releases/latest" |  # Get latest release from GitHub api
    grep '"tag_name":' |                                                        # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                                # Pluck JSON value
}
