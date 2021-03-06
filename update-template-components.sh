for repo in "git@github.com:CloudCannon/urban-jekyll-bookshop-template.git" \
			"git@github.com:CloudCannon/cause-jekyll-bookshop-template.git" \
			"git@github.com:CloudCannon/justice-jekyll-bookshop-template.git" \
			"git@github.com:CloudCannon/hydra-jekyll-bookshop-template.git"
do
	git clone $repo ../repo

	cd ../repo
	git remote add cc-template-components git@github.com:CloudCannon/cc-template-components.git
	git fetch cc-template-components

	git branch cc-template-components_main cc-template-components/main

	for folder in components
	do
		git checkout -f cc-template-components_main
		git subtree split --prefix=$folder -b temp_branch
		git checkout -f staging

		if [ -d component-library ]
		then
				git subtree merge --prefix=component-library temp_branch
		else
				git subtree add --prefix=component-library temp_branch
		fi

		git branch -D temp_branch
	done

	mkdir -p site
	for folder in _includes _layouts assets
	do
		git checkout -f cc-template-components_main
		git subtree split --prefix=$folder -b temp_branch
		git checkout -f staging

		if [ -d site/$folder ]
		then
				git subtree merge --prefix=site/$folder temp_branch
		else
				git subtree add --prefix=site/$folder temp_branch
		fi

		git branch -D temp_branch
	done

	git push

	cd ../cc-template-components
	rm -rf ../repo
done