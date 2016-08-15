parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'

}

parse_git_status() {
        c=`git status --porcelain 2> /dev/null | wc -l`
        if [ $c -eq 0 ]
        then
          echo 34
        else
          echo 3
        fi
}

export PS1="\W\[$(tput sgr0)\]\[\033[38;5;243m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;\$(parse_git_status)m\] ▶ \[$(tput sgr0)\]"
