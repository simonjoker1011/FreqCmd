source ./parts/env.sh
read -e -p "plz enter svc name: " svc
echo
echo "plz select a branch:"
echo "			1) $bddoOffBranch"
echo "			2) $bddcOffBranch"
echo "			3) $skypOffBranch"
read -e -p ">> " no
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

cd ~/dev/sky/$svc
echo    cmd: git push origin $branch:refs/for/$branch
echo

git push origin $branch:refs/for/$branch

