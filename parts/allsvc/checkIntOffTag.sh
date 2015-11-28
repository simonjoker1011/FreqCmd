        cd $1
        git pull origin master

        gradle odiffint

        cd ../skyp
        gradle odiffint

        cd ../bddc
        gradle odiffint
