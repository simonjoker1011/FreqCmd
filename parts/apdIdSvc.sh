source ./parts/env.sh
read -e -p "plz select a svc to append change-Id: " svc
cd $skyPath/$svc
echo

scp -p -P 29418 simonhuang@gerrit.truetel.com:hooks/commit-msg .git/hooks/

echo
echo done!!
