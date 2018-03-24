#!/bin/bash -   
#title          :git-cleanup.sh
#description    :Cleans old branches and remotes from a local Git repository
#author         :ef0ntan
#date           :20180324
#version        :0.0.1  
#usage          :./git-cleanup.sh
#notes          :       
#bash_version   :4.3.48(1)-release
#============================================================================

MAIN_BRANCH="master"
git checkout $MAIN_BRANCH -q
#git fetch -p

# delete local branches no longer on remote
remote_branches=$(git ls-remote --heads --quiet | grep -v master | awk -F/ '{ print $3 }')
branches_to_delete=()

for local_branch in $(git for-each-ref --format='%(refname:short)' refs/heads/ | grep -v $MAIN_BRANCH); do
    if ! echo ${remote_branches[@]} | grep -q -w "$local_branch"; then
        branches_to_delete+=("$local_branch")
    fi
done

# if there are branches to delete
if [ ! ${#branches_to_delete[@]} -eq 0 ]; then
    # prompt for confirmation
    echo "All this branches are no longer on remote: ${branches_to_delete[@]}"
    echo -n -e "Are you sure you want to delete them? (y/n) "
    read answer
    echo

    # delete
    if echo "$answer" | grep -iq "^y" ;then
        echo "${branches_to_delete[@]}" | xargs git branch -D
        echo
        echo "All local branches without a remote where deleted." 
    fi
else 
    echo "There are no local branches without a remote."
fi

