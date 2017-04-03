if [[ -t 1 ]]; then
  Underline=$(tput sgr 0 1)
  Bold=$(tput bold)
  Red=$(tput setaf 1)
  Green=$(tput setaf 2)
  Yellow=$(tput setaf 3)
  Blue=$(tput setaf 4)
  Purple=$(tput setaf 5)
  Cyan=$(tput setaf 6)
  White=$(tput setaf 7)
  Reset=$(tput sgr0)
fi

info() {
  if [[ -t 1 ]]; then
    printf "\n${Green}=>${Reset} ${Bold}${1}${Reset}\n\n"
  else
    printf "=> $1\n"
  fi
}

error() {
  if [[ -t 1 ]]; then
    printf "\n${Red}=>${Reset} ${Bold}${1}${Reset}\n\n"
  else
    printf "=> $1\n"
  fi
}

print_help() {
  grep '^#/' <"$0" | cut -c 4-
}

progress_bar() {
  local position=$1
  local last=$2
  local columns=$(tput cols)
  local stat="$position/$last"

  local bar_size=$(( $columns - ${#stat} - 8 ))
  local point_size=$(bc <<< "scale=3; $bar_size / $last")
  local bar_position=$(bc <<< "scale=0; (($point_size * $position) + 0.5)/1")

  printf "\r ["
  for cursor in $(seq 1 $bar_size); do
    if [[ $cursor -le $bar_position ]]; then
      printf "#"
    else
      printf " "
    fi
  done
  printf "] ($stat) "
}
