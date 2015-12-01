source ./parts/env.sh


read -e -p "plz select a svc to append change-Id on latest commit: " svc
cd $skyPath/$svc
echo

git reset HEAD^
git add --all

read -e -p "plz enter comment: " cmt

git commit -m "$cmt"

echo
echo done!!
echo

read -e -p "press y push to gerrit directly" y
echo

if [ $y == "y" ]
then
	echo "plz select a branch:"
	echo "                  1) $bddoOffBranch"
	echo "                  2) $bddcOffBranch"
	echo "                  3) $skypOffBranch"
	read -s no
	echo
	
	case $no in
	        "1")
	                branch=$bddoOffBranch
	                ;;
	        "2")
	                branch=$bddcOffBranch
	                ;;
	        "3")
	                branch=$skypOffBranch
	                ;;
	esac

	echo ">> push $svc to branch: $branch (plz ensure change-Id appended)"
	echo

	cd $skyPath/$svc
	echo    cmd: git push origin $branch:refs/for/$branch
	echo
	
	git push origin $branch:refs/for/$branch
fi
