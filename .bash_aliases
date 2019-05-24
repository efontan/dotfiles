# Git aliases
alias pull='git pull origin'
alias push='git push origin'
alias merge='git merge'

# show open ports
alias ports='netstat -tulanp'

# MAVEN aliases
function updatePomVersions() {
    mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$1
}
alias updateMavenPoms=updatePomVersions;

alias dpkgResolvconf='~/dotfiles/scripts/updateResolvConf.sh'
alias mvnFindDependency='~/dotfiles/scripts/mvnFindDependency.sh'
alias mvnInstall='mvn install -U -Dmaven.test.skip=true'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias gitCleanup='/home/efontan/dotfiles/scripts/gitCleanup.sh'

