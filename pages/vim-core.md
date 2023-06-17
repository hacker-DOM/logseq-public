- ex commands that operate on the text in a buffer
	- [range]d [x] - delete specified lines [into register x]
	- [range]y [y] - yank specified lines [into register x]
	- [line]pu [x] - put the text from register x after the specified line
	- [range]t/co address - copy the specified lines to below the line specified by {address}
	- [range]m address - move the specified lines to below the line specified by {address}
	- [range]j - join the specified lines
	- [range]norm commands - execute normal mode commands on each specified line
	- [range]s/pattern/string/[flags] - replace
	- [range]g/{pattern}/cmd - execute Ex command on all specified lines where {pattern} matches
- visual modes
	- visual block is only one where you can edit all lines with I/A
	- visual & visual line are only ones where pressing `/` fills in `'<,'>`
- mapping
	- map
		- recursive
	- noremap
		- non-recursive
	- n
		- normal mode
	- v
		- visual mode
		- select mode
	- o
		- operator pending mode
	- x
		- visual mode
	- s
		- select mode
	- map!
		- insert and command-line
	- i
		- insert mode
	- c
		- command line mode
	- l
		- called vim lang arg pseudo mode
		- insert, command, lang-arg
	- t
		- terminal
- vim-packages
	- vim8 native packages
		- added in Vim8
		- from help:
			- a vim package is a directory that contains one or more plugins
				- the advantage over normal plugins
					- a package can be an archive/git repo
						- makes it
							- easy to update
							- isolated
					- can contain multiple plugins that depend on each other
					- can contain plugins
						- that are automatically loaded on startup
						- ones that are only loaded when needed
							- with `:packadd`
		- from https://learnvim.irian.to/customize/vim_packages
			- `~/.vim/pack/all-my-plugins/start/plugin1/...`
				- get loaded automatically
			- `~/.vim/pack/all-my-plugins/opt/plugin2/...`
				- `:packadd killersheep`
					- or
				- `packadd! your-package`
					- The `!` is for when you run `vim --noplugin` so Vim won't add your package.
		- in neovim
			- i think in `~/.local/share/nvim/site/pack`
			- also `:set packpath?`
	- vim-plug
		- i think in `~/.local/share/nvim/plugged`
		- just git repos
	- packer
		- `packpath / packer`
			- start...
			- opt...
		- also just git repos
- [[vim-modes]]
- vim-events
  collapsed:: true
	- vim docs
		- BufNew
			- just after creating a new buffer
			- also when renaming
		- BufNewFile
		- BufAdd
			- just after
				- creating a new buffer
					- which is added to the buffer list
				- adding a buffer to the buffer list
				- renaming buffer
			- NOT triggered for initial buffers created during startup
			- BEFORE BufEnter
			- NOTE current buffer "%" may be different from the buffer being created
				- <afile>
					- during autos, is replaced with the file name of the buffer being manipulated
		- BufRead/BufReadPost
			- before modelines
			- based on https://github.com/vim/vim/blob/3ea8a1b1296af5b0c6a163ab995aa16d49ac5f10/runtime/filetype.vim
				- i think this is where filetype is attempted to be detected
		- BufWinEnter
			- after modelines
		- BufWinLeave
			- before is removed from a window
			- not when it's still visible in another window
			- BEFORE BufUnload, BufHidden
		- BufDelete
			- if buffer was loaded, AFTER BufUnload
			- also just before a buffer in the buffer list is renamed
		- BufFilePre/Post
			- changing name with `:file` or `:saveas`
		- BufModifiedSet
			- after `modified` value changed
		- BufHidden
			- before becomes hidden
				- when there are no longer windows that show it
		- BufLeave
			- when leaving to another buffer
			- also when leaving or closing the current window (and the new current window is not for the same buffer)
	- when a new buffer is opened
		- according to chatgpt
			- BufNew
			- BufRead
				- about to be read
				- only if is being opened from existing file
			- BufReadPost
				- buffer has been read
				- only if being opened from existing file
			- BufEnter
				- has been entered
				- is now active buffer
				- chatgpl claims this is when filetype is detected
			- BufWinEnter
				- has been entered into specific window
- vimscript
	- `==` depends on `set ignorecase/noignorecase`
	- use
		- `==#`
			- case-sensitive no matter user's settings
		- `==?`
			- case-insensitive no matter user's settings
- `:s|~/work/vise|.|g`  doesn't work
	- `E486: Pattern not found: shift`
	- cannot use `\`, `"`, or `|` as delimeterr
		- https://vim.fandom.com/wiki/Alternate_delimiters_for_the_replace_command
		- in `sed` I think you can use `|`
		- using `,` worked
-
	-