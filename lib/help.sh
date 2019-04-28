#!/bin/bash

function showHelp() {
  
  echo "\n\t\t\t\tVIMNOTE 📝\n"
    
  echo "\n\tUSAGE:  vn [-u] | [-h, -help, --h, --help]"

  echo "\n\tCOMMANDS\n"

  echo "\tvn              : VimNote\n"
  echo "\t\t\tOpens notes.md in Vim so you can write"
  echo "\t\t\tstuff down. Nothing fancy.\n"

  echo "\t[-u]            : Update\n"
  echo "\t\t\tUpdates your remote VimNotes repository with"
  echo "\t\t\tany local changes to your notes.md file.\n"

  echo "\t[-s,"
  echo "\t--set-remote]   : Set Remote\n"
  echo "\t\t\tSets the remote git repository your notes.md"
  echo "\t\t\tfile will be pushed to when \`vn -u\` is run.\n"

  echo "\t[-h, -help,"
  echo "\t--h, --help]    : Help\n"
  echo "\t\t\tShows this help screen.\n"

  echo "\n\t---\n"

  echo "\n\tABOUT\n"

  echo "\tVimNote is pretty basic."
  echo "\tIt provides a place for you to jot down thoughts,"
  echo "\ttodos, reminders, and more, without leaving the"
  echo "\tterminal. Version control is handled by git, meaning"
  echo "\tthat you have complete autonomy as to where your"
  echo "\tnotes are hosted.\n"

  echo "\n\tFeel free to fork VimNote and customize to your needs."

  echo "\n\tTo uninstall, run \`vn uninstall\`."

  echo "\n\tPlease open any issues at \`github.com/jaredgorski/VimNote\`"

  echo "\n\t\t\t\t...Enjoy!\n"
}

