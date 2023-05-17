#
# fzf jump directory function
#
# requires: https://github.com/jethrokuan/z
# __________________________
#

function fzf_jump_directory

  if not type -q z
    set_color red
      echo "_fzf_jump_directory: z not found." >&2
    set_color normal
    return 1
  end

  set current_token (commandline --current-token)

  set command_z (
    z -l | sort -rn | cut -c 12- | _fzf_wrapper --query=$current_token $fzf_shell_vars_opts
  )

  if test $status -eq 0
    cd $command_z
  end

  commandline --function repaint

end
