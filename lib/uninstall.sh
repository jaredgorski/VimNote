#!/bin/bash

function uninstallVimNote() {
  vnExec="[ -s \"$HOME/.VimNote/bin/vn\" ] && source \"$HOME/.VimNote/bin/vn\""

  notifiedOfUninstall=false

  for profile in bashrc zshrc bash_profile
  do
    if [[ -s "$HOME/.$profile" ]]
    then
      if grep -q "$vnExec" "$HOME/.$profile"
      then
        awk '!/#KEEP_THIS_COMMENT-AddsVimNoteToShell/' "$HOME/.$profile" > .temprc && mv .temprc "$HOME/.$profile"
        rm -rf "$HOME/.VimNote"
        unset vnDir
        if [[ $notifiedOfUninstall = false ]]
        then
          printf "\n\tVimNote uninstalled successfully. Restart your shell.\n\n"
          notifiedOfUninstall=true
        fi
      else
        if [[ $notifiedOfUninstall = false ]]
        then
          printf "\n\tVimNote is not currently installed on your profile. \n\n\tExecute \`./install.sh\` if you would like to install.\n\n"
          notifiedOfUninstall=true
        fi
      fi
    fi
  done
}
