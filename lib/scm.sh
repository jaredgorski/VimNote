#!/bin/bash

function setRemote() {
  isRepo="$(cd $HOME/.VimNote/usr/vimnotes; git rev-parse --is-inside-work-tree 2> /dev/null)"

  if [[ $isRepo ]]
  then
    currentPwd=$PWD

    echo -n "\nPlease enter a valid remote git repository to store your notes: "

    read vnRemoteUrl

    cd $HOME/.VimNote/usr/vimnotes
    if git config remote.vimnotes.url > /dev/null
    then
      git remote set-url vimnotes $vnRemoteUrl
    else
      git remote add vimnotes $vnRemoteUrl
      git add notes.md
      git commit -m "Initial notes commit"
      git push -u vimnotes master
    fi

    echo "\nTo update your notes, simply enter \`vn -u\`. To change your VimNote git remote,"
    echo "enter \`vn --set-remote\`."

    echo -n "\nWould you like to update your notes now? (Y/n) "

    read answer

    cd $currentPwd

    case ${answer:0:1} in
      y|Y) echo "\n"
           updateRemote internal;;
      *)   cd $currentPwd
           echo " ";;
    esac
  else
    cd $HOME/.VimNote/usr/vimnotes
    echo "\n"
    git init
    cd $currentPwd
    setRemote
  fi
}

function updateRemote() {

  currentPwd=$PWD

  if [[ $1 != "internal" ]]
  then
    cd $HOME/.VimNote/usr/vimnotes
    if ! git config remote.vimnotes.url > /dev/null
    then
      setRemote
    fi
  fi

  cd $HOME/.VimNote/usr/vimnotes
  if ! git diff --exit-code
  then
    now=$(date)

    cd $HOME/.VimNote/usr/vimnotes
    git add notes.md
    git commit -m "Update notes -- ${now}"
    git pull vimnotes master --rebase
    git push vimnotes master
  else
    cd $HOME/.VimNote/usr/vimnotes
    git pull vimnotes master --rebase
    git push vimnotes master
  fi

  cd $currentPwd
}

