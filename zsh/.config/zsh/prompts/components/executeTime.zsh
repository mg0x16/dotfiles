
zmodload zsh/datetime

__prompt_component_executeTime_get_current_time() {
  echo $EPOCHSECONDS
}

# turns seconds into human readable time, 165392 => 1d 21h 56m 32s
__prompt_component_executeTime_convert_time() {
  local human total_seconds=$1 
  local days=$(( total_seconds / 60 / 60 / 24 ))
  local hours=$(( total_seconds / 60 / 60 % 24 ))
  local minutes=$(( total_seconds / 60 % 60 ))
  local seconds=$(( total_seconds % 60 ))
  (( days > 0 )) && human+="${days}d "
  (( hours > 0 )) && human+="${hours}h "
  (( minutes > 0 )) && human+="${minutes}m "
  human+="${seconds}s"
  echo $human
}

__prompt_component_executeTime_preexec() {
  __executeTime_cmd_start_time=$(__prompt_component_executeTime_get_current_time)
}

__prompt_component_executeTime_precmd() {
  unset __prompt_component_executeTime_value
  if [ -n "$__executeTime_cmd_start_time" ]; then
    local cmd_end_time=$(__prompt_component_executeTime_get_current_time)
    local elapsed=$(( cmd_end_time - __executeTime_cmd_start_time ))

    if (( elapsed >= 5 )); then
      local elapsed_human=$(__prompt_component_executeTime_convert_time $elapsed)
      __prompt_component_executeTime_value="[%F{yellow}${elapsed_human}%f]"
    fi
    unset __executeTime_cmd_start_time
  fi
}

__prompt_component_executeTime_render() {
  if [ -n "$__prompt_component_executeTime_value" ]; then
    echo -n "$__prompt_component_executeTime_value"
  fi
}