itunes_volume() {
  osascript -e 'tell application "iTunes" to get sound volume'
}

set_itunes_volume() {
  local volume=$1
  osascript -e "tell application \"iTunes\" to set sound volume to ${volume}"
}

itunes_play() {
  osascript -e 'tell application "iTunes" to play'
}

itunes_pause() {
  osascript -e 'tell application "iTunes" to pause'
}

itunes_stop() {
  osascript -e 'tell application "iTunes" to stop'
}

play_playlist() {
  local name=$1
  osascript -e "tell application \"iTunes\" to play playlist \"${name}\""
}
