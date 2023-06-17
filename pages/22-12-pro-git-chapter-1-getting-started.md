- getting started
- contents
	- background on version control tools
	- how to get git running on your system
	- how to get it set up to start working with
- about version control
	- vc is a system that records changes to a file or set of files over time so that you can recall specific versions later
	- local version control systems
		- `rcs`
			- early vcs
			- no longer in Mac Command-line Tools..
			- keeps 'patch sets' of files in a special format
	- centralized version control systems
		- issue: people need to collaborate with others
		- => CVCS
			- e.g. CVS, Subversion, Perforce
		- single server that contains all versioned files
			- and
		- multiple clients that check out files from it
		- advantages
			- everyone knows what everybody else is doing
			- administrators have fine-grained control over who can do what
			- far easier to administer a CVCS that to deal with many local databases
		- disadvantages
			- central point of failure
				- downtime
					- and
				- loss of data
	- distributed version control systems
		- => DVCS
			- e.g. Git, Mercurial, Bazaar, Dars, (Sapling)
		- clients don't just checkout files, they mirror the whole repository
		- pro: multiple remote repositories
- a short history of git
	- 1991-2002
		- changes to linux kernel passed around as patch and archived files
	- 2002
		- started using BitKeeper
	- 2005
		- no longer free account @ BitKeeper
		- => developed their own VCS
- git basics
	- git uses snapshots, not differences
	- most operations are local
	- git has integrity
		- everything is check-summed (hashed?) before it is stored
			- and later referred to by that checksum (hash?)
		- => impossible to change contents of any file or directory
			- w/o git knowing about it
		- => also can't lose information in transit
		- git uses SHA-1 (160-bit)
	- mostly only _adds_ data
- three states
	- working directory
	- staging area (index)
	- .git directory
- first-time git setup
	- config files
		- `/etc/gitconfig`
			- contains values for every user on the system
			- if you pass `--system` to `git config`, it reads & writes from this file
		- `~/.gitconfig` or `~/.config/git/config` file
			- specific to your user
			- if you pass `--global` to `git config`, it reads & writes from this file
		- `./.git/config`
			- specific to that single repository
	- set
		- name
		- email
		- editor
	-
		-