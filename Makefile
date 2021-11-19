gitrcommit:
	git config --global credential.helper store
	git add -u
	git add Makefile README.md
	-git add *
	-git add */*
	-git commit -a -m "`date`"
	git pull
	git push origin main
	git diff --name-only HEAD HEAD~1
gitrupdate:
	git config --global credential.helper store
	git pull

