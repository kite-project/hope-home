appcache:
	printf "CACHE\nMANIFESTCACHE:\n" > cache.appcache
	find . -type f | sed 's/[.]\///g' | egrep '[.](png|js)$$' >> cache.appcache
