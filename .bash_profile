parse_git_branch() {
    c=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'`
    echo "$c"
}

parse_git_status() {
        c=`git status --porcelain 2> /dev/null | wc -l`
        if [ $c -eq 0 ]
        then
          echo 64
        else
          echo 3
        fi
}

parse_git_repo() {
	repo_dir=`git rev-parse --show-toplevel 2> /dev/null || pwd`
	cur_dir=`pwd`
	if [ "$repo_dir" == "$cur_dir" ]
	then
	  echo
	else
	  repo=`basename $repo_dir`
	  echo " @ $repo"
	fi
}

export PS1="\[\033[38;5;15m\]\W\[$(tput sgr0)\]\[\033[38;5;243m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;238m\]\$(parse_git_repo)\[$(tput sgr0)\]\[\033[38;5;\$(parse_git_status)m\] -> \[$(tput sgr0)\]"

# Password generation
alias pwdgen="openssl rand -base64 $1"

# Better ls, ll
alias ll="ls -lh"
alias ls="ls -G"

# hub
#alias git=hub
