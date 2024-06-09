# Upload to remote=eideal-gitlab
# git remote -v: check if eideal-gitlab exists
# --follow-tags: also upload tags
# refs/heads/android_12_eideal_dev: upload to remote branch:android_12_eideal_dev

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [remote-branch-name]"
  echo -e "\tif [remote-branch-name] is null"
  echo -e "\tthen [remote-branch-name]=android_12_eideal_dev"
  return
fi

remotebranch=$1
if [ -z "$1" ]
then
	remotebranch="refs/heads/android_12_eideal_dev"
else
	remotebranch="refs/heads/$1"
fi
echo "$remotebranch"
git push --follow-tags -u eideal-gitlab HEAD:"$remotebranch" 
