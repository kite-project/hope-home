appcache:
	printf "CACHE\nMANIFESTCACHE:\n" > cache.appcache
	find . -type f | sed 's/[.]\///g' | egrep '[.](png|js)$$' >> cache.appcache

makedeploy:
	git submodule add -b gh-pages git@github.com:jonathanKingston/hope-home.git _deploy
deploy:
	( cd _deploy && \
	git pull && \
	rsync -rz --delete  --exclude=tmp/ --exclude=_deploy/ --exclude=.git --exclude=./ . _deploy && \
	git add . --all && \
	git commit -m "Push new release" && \
	git push origin gh-pages )
