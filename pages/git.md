- Gitflow, 26k, Shell, 12-09
	- https://github.com/nvie/gitflow
- submodules
	- add a reposity
		- `git submodule add repository_url path/to/directory`
	- movgit submodule add repository_url path/to/directore submodule to tag/branch/commit
		- ```
		  cd submodule_dir
		  git checkout v1.0
		  cd ..
		  git add submodule_dir
		  git commit -m "moved submoduleto v1.0"
		  git push
		  ```
	- cloning:
		- at once: `git clone --recursive [git-link]`
		- ex-post: `git submodule update --init --recursive`
- exclude directory in `git diff`/`git difftool`
	- `git diff[tool] [commit] -- . ':!directory'`
		- https://stackoverflow.com/a/29374503/4204961