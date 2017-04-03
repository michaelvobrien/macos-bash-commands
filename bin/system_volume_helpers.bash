system_volume() {
  osascript -e 'output volume of (get volume settings)'
}

set_system_volume() {
  local volume=$1
  osascript -e "set volume output volume ${volume}"
}

mute_system() {
  osascript -e 'set volume output muted true'
}

unmute_system() {
  osascript -e 'set volume output muted false'
}

is_system_muted() {
  osascript -e 'output muted of (get volume settings)'
}
