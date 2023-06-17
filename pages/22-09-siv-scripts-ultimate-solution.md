- Ultimate Solution to Python Virtual Environments: pyenv + virtualenvwrapper, 17-08
	- https://alysivji.github.io/setting-up-pyenv-virtualenvwrapper.html
- tried several solutions
	- [[anaconda]]
		- too bloated
	- [[virtualenv]] + [[virtualenv-wrapper]]
		- had to manually manage Python installations when seetting up envs for different versions
	- [[docker]]
		- bad performance
- `pyenv install --list`
	- list all installable versions
- `pyenv shell [version]`
	- sets a shell-specific Python version
	- overrides global and local config
- `brew install pyenv-virtualenvwrapper`
	- add to [[.zshrc]]
		- ```
		  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
		  export WORKON_HOME=$HOME/.virtualenvs
		  pyenv virtualenvwrapper_lazy
		  ```
- every time we install a new version of Python, we need to install `virtualenvwrapper`
	- this is done with either `pyenv virtualenvwrapper` or `pyenv virtualenvwrapper_lazy` (preferred)
- now we can use `mkvirtualenv`, `deactivate`, `workon`