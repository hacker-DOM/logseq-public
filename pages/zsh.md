- [[zsh-where]]
- resources
	- https://github.com/rothgar/mastering-zsh/
	- https://thevaluable.dev/zsh-install-configure-mouseless/
		- (and the three following articles)
	- profiling
		- https://stevenvanbael.com/profiling-zsh-startup
- `ZDOTDIR`
	- where `.zshrc` will be sourced
- `(N)`
	- glob qualifier
		- sets NULL_GLOB option
			- loop won't error if that location is missing or empty
- `fpath`
	- like `$PATH`
		- but it is an array
			- ideally use `fpath+=('/some/directory')`
	- used mainly for `shared functions`
- shared functions
	- loaded into a shell with `autoload` command
	- shared funcs in `fpath` don't need to declare a function name or have a function definition
	- `autoload -U blah`
		- makes file `blah` in `fpath` available as `blah`
	- tip:
		- put `emulate -L zsh` at the top of the function file to avoid user configuration or parameter expansion
	- most functions will still go into `.zshrc` file
- history
	- `fc`
		- open last command in `$EDITOR`
	- `fc -l 3700`
		- list commands starting from number 3700
	- `fc -l -20`
		- list 20 most recent commands
	- `fc -ln -20`
		- `-n` - don't include line number
	- `!!`
		- last command
	- `!:*` / `!*`
		- last arguments
	- `!:$` / `!$`
		- last argument/words
	- `!:1` / `!^`
		- first argument
	- `!3700`, `!!:s/foo/bar`, and even `fc boo=bar` are probably useless, because it's easier to use [[clw]]
- prompt
	- zsh can use `$PS1` variable like bash, but you should use `$PROMPT`
- parameter substitution
	- `${var:h}` - leave only head (i.e. `dirname`)
	- `${var:t}` - leave only tail (i.e. `basename`)
- keymaps
	- a keymap in ZLE is a set of bindings between key sequences and ZLE commands
	- each keymap has one or more names
		- when all of a keymap's names are deleted, it disappears
	- bindkey used to manipulate keymap names
	- initally 8 keymaps
		- emacs
		- viins
		- vicmd
		- viopp
		- visual
		- isearch
		- command
		- .safe
			- special
			- can never be altered
- split a string to array by comma
	- `local line_split=("${(@s/,/)line}")`
- gotchas
	- `path` is an array of `PATH`
		- see https://superuser.com/a/1734017/852686
- set (bash)
	- `-x` debugging
	- `e` halt on errors (non-zero return codes of programs)
	- `-u` treat unset variables as an error and exit immediately
	- `k` All arguments in the form of assignment statements are placed in the environment for a command, not just those that precede the command name.
	- `o` assignment of variables for subprograms
	- `m` use builtins like `fg` and `bg`
- `whence`
	- zsh builtin
	- ` `
		- interpret arg, with expansion if defined as an `alias`
		- similar to `command -v`
	- `-v`
		- display type of arg, with location if defined as a function, or binary
		- equivalent to `type` and `command -V`
	- `-c`
		- same as `-v`
		- but display content of shell functions instead of locations
		- equivalent to `which`
	- `-a`
		- show all occurrences on command path
		- equivalent to `where`
	- `-p`
		- search only `PATH` for command
		- ignores builtins, aliases, or shell functions
		  // builtins, binaries, aliases, shell functions
- [[bash-test]]