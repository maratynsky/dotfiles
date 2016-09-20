parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

parse_git_status() {
        c=`git status --porcelain 2> /dev/null | wc -l`
        if [ $c -eq 0 ]
        then
          echo 28
        else
          echo 3
        fi
}

export PS1="\[\033[38;5;15m\]\W\[$(tput sgr0)\]\[\033[38;5;243m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;\$(parse_git_status)m\] ► \[$(tput sgr0)\]"

# Password generation
alias gpwd="openssl rand -base64 $1"

# Better ls, ll
alias ll="ls -lh"
alias ls="ls -G"

# hub
alias git=hub

# clear snapshots from .m2
alias clean_mvn_repo="find ~/.m2/repository -name \*SNAPSHOT -type d -print0 | xargs -0 rm -rf"
