source $parts/env.sh

read -e -p "plz input svc name to retag: " svc
echo
read -e -p "have checkout on related commit? (y/n) " yn

if [ $yn ]&&[ $yn == "y" ]; then
	read -e -p "plz input tag name: " tag

	cd $skyPath/$svc
	git tag -d $tag
	git tag $tag
	git push origin :$tag
	git push origin $tag
fi
