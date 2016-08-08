parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'

}

parse_git_status() {
        c=`git status --porcelain 2> /dev/null | wc -l`
        if [ $c -eq 0 ]
        then
          echo 32
        else
          echo 33
        fi
}

export PS1="\W\033[90m\]\$(parse_git_branch)\[\033[00m\] \e[\$(parse_git_status)m▶\e[0m "
