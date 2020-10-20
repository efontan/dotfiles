#!/bin/bash 
#title          :gitCleanup.sh
#description    :Cleans old branches and remotes from a local Git repository
#author         :ef0ntan
#date           :20180324
#version        :0.0.1  
#usage          :./gitCleanup.sh develop
#notes          :       
#bash_version   :4.3.48(1)-release
#============================================================================
set -e
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


MAIN_BRANCH=$1

if [[ -z "${MAIN_BRANCH}" ]]; then
    echo -e "${RED}Main branch name required, please provide the main branch name. \nExample: ./gitCleanup.sh develop${NC}"
    exit 1
fi

git checkout $MAIN_BRANCH -q
git fetch -p

# delete local branches no longer on remote
remote_branches=$(git ls-remote --heads --quiet | grep -v $MAIN_BRANCH | awk -F/ '{ print $3 }')
branches_to_delete=()

for local_branch in $(git for-each-ref --format='%(refname:short)' refs/heads/ | grep -v $MAIN_BRANCH); do
    if ! echo ${remote_branches[@]} | grep -q -w "$local_branch"; then
        branches_to_delete+=("$local_branch")
    fi
done

# if there are branches to delete
if [ ! ${#branches_to_delete[@]} -eq 0 ]; then
    # prompt for confirmation
    echo -e "All this branches are no longer on remote: ${YELLOW}${branches_to_delete[@]}${NC}"
    read -p "$(echo -e ${YELLOW}"Are you sure you want to delete them? (y/n) "${NC})" -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then 
	    echo "No branches where deleted."
	    exit 0
	fi

     # delete
    echo "${branches_to_delete[@]}" | xargs git branch -D
    echo
    echo -e "${GREEN}All local branches without a remote where deleted.${NC}" 

else 
    echo "There are no local branches without a remote."
fi

