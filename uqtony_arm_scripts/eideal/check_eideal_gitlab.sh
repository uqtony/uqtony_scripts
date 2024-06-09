eideal_gitlab_exist(){
        eidealgitlab=$(git remote -v|grep eideal-gitlab)
        if [ -z "$eidealgitlab" ]
        then
                # 1 is true
                return 1
        else
                # 0 is false
                return 0
        fi
}

try_add_gitlab(){
	eidealgitlab=$(git remote -v|grep gitlab|grep eideal|awk 'NR==1{print $2}')
	echo "$eidealgitlab"
        if [ -z "$eidealgitlab" ]
	then
		echo "No gitlab found"
	else	
		echo "Add eideal-gitlab: $eidealgitlab"
		git remote add "eideal-gitlab" "$eidealgitlab"
	fi
}

if eideal_gitlab_exist
then
        echo "gitlab exist"
else
        echo "no gitlab"
	try_add_gitlab
fi
