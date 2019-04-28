#!/bin/bash

export vnDir="$( cd -P "$( dirname "$0" )" && pwd )"

chmod 745 ./lib/help.sh
chmod 745 ./lib/scm.sh
chmod 745 ./lib/uninstall.sh
chmod 745 ./bin/vn

rm -rf ./.git

if [[ $vnDir ]]
then
  if [[ "$vnDir" != "$HOME/.VimNote" ]]
  then
    ln -fs $vnDir $HOME/.VimNote
  fi

  vnExec="[ -s \"$HOME/.VimNote/bin/vn\" ] && source \"$HOME/.VimNote/bin/vn\" #KEEP_THIS_COMMENT-AddsVimNoteToShell"

  nowInstalled=false
  alreadyInProfile=false

  for profile in bashrc zshrc bash_profile
  do
    if [[ -s "$HOME/.$profile" ]]
    then
      if grep -q "$vnExec" "$HOME/.$profile"
      then
        printf "\n\tVimNote already exists in your $profile file.\n"

        if [[ -d "./VimNote" ]]
        then
          rm -rf ./VimNote # Deletes duplicate caused by concurrent reinstall
        fi

        alreadyInProfile=true
      else
        printf "\n$vnExec" >> "$HOME/.$profile"
        printf "\n\tAdded VimNote to $HOME/.$profile\n"
        nowInstalled=true
      fi
    fi
  done

  if [[ $nowInstalled = true ]]
  then
    printf "\n\n\t\t\tVIMNOTE 📝\n"
    printf "\n\n\tVimNote installed successfully! 🎉\n"
    printf "\n\tTo use VimNote, open a new shell session and type \`vn\`\n"
    printf "\n\tFor a list of commands, type \`vn --help\`\n\n"
  elif [[ $alreadyInProfile = true ]]
  then
    printf "\n\n\t\t\tVIMNOTE 📝\n"
    printf "\n\n\tTo use VimNote, type \`vn\`\n"
    printf "\n\tFor a list of commands, type \`vn --help\`\n\n"
  else
    printf "\n\tERROR: VimNote not added to shell profile.\n"
    printf "\n\tPlease check your profile and add the following line to install manually\n"
    printf "\n\t--> $vnExec\n\n"
  fi
else
  printf "\n\tERROR: VimNote could not be added to shell profile.\n"
  printf "\n\tPlease create an issue on Github to report this.\n"
  printf "\n\thttps://github.com/jaredgorski/VimNote/issues\n\n"
fi

