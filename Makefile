all: 
	hugo

cleanbuild:
	rm -rf docs/*
	hugo

preview:
	hugo serve --buildDrafts

drafts:
	@hugo list drafts

push:
	@hugo
	@echo
	@git status -s >/dev/null && { echo "Git tree not clean." ; echo ; git status; } || git push origin master



