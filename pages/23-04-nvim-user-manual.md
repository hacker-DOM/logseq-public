- 1 about the manuals
	- two manuals
		- user manual
			- reads like a book
		- reference manual
			- precise description of everything
		- `ctrl-]` to jump to a subject under the cursor
		- `ctrl-o` to jump back
			- or `ctrl-t` (pop tag)
- 2  first steps in vim
  id:: 644126bc-62bb-4ec9-9e6d-8a50bc5c64ad
	- `u` undoes
	- `ctrl-r` redoes
	- `U` undoes all changes on current line
		- can undo with `U` or `u`
	- `a`, `o`, `O`
	- `3a!<esc>` to add three exclamation points
	- `ZZ`
	- `:q!`, `:e!` - edit original version of file
	- `:h`
		- `ctrl-a`
			- `^a` in normal mode
		- `i_<up>`
			- `<up>` in insert mode
		- `'number'`
			- vim option
		- `e37`
			- error code
		- `:s`
			- command
		- `g_ctrl-a`
			- `g^a` in normal mode
		- `append()`
			- function
	- `:helpgrep deleting`
		- `:cnext`
		- `:copen`
- 3 moving around
	- `w`/`b`
	- `e`/`ge`
	- `$`, `^`, `0`
	- `f`/`F`
	- `t`/`T`
	- `%` will move to matching paren
	- `33G`, `gg`
	- `50%`
	- `H`/`M`/`L`
	- `ctrl-g`
	- `:set number`
	- `:set ruler`
	- screens / windows
	- search `/string`
	- `:set ignorecase`
	- `*`/`#`
	- `g*`/`g#`
	- `/\<i`, `/e\>`
	- search tuning
		- `:set hlsearch` (highlight search)
		- `:set nowrapscan` (don't wrap file on search)
		- `:set noincsearch` (don't search while typing, only after `<enter>`)
	- `/^the$`
		- here, whitespace matters
		- `the ` will not match
	- `/.`/`/\.`
	- ``
	- `ma`/`a
	- `'a`
- 4 making small changes
	- with `d3w`,
		- vim deletes up to (not including) position where motion takes cursor
		- whether the character under cursor is included depends on the command
			- exclusive vs inclusive
	- `d$` is inclusive
	- `cw` works like `ce`
		- space before (last) word is not deleted
	- `dd`, `cc`
	- `D` = `d$`, `C` = `c$`
	- `x`, `X`, `countx`
	- `s` = `cl`, `S` = `cc`
		- useless imho
	- `r`
	- `.`
	- `v`, `V`, `ctrl-v`, `v_o`, `v_O`
	- `p`, `P`, `countp`
	- `xp` swap
	- `y`, `yy`, `Y`
	- `*yy`, `*p`
	- `daw`
		- deletes a word
			- includes whitespace at end of word
				- beginning of word if at the end of the line
	- `cis`, `cas`
	- `as` also works in visual mode
	- `R`
	- `~`
		- change case of char and move to next char
		- cannot use with motion (not an operator)
	- `I`, `A`
- 5 Set your settings
	- init.vim
	- `:e $MYVIMRC`
	- `set`
		- `backspace=...`
			- behavior of bs (in insert)
		- `autoindent`
			- keep indentation of new lines
		- `backup`
			- backup file
		- `history=50`
			- commands and search patterns
		- `ruler`
			- show  cursor position in lower right corner
		- `showcmd`
			- incomplete command in lower right corner
	- mappings
	- packages
		- optional
		- automatically loaded on startup
	- plugins
		- global
		- filetype
	- `:filetype plugin on`
	- `:options`
	- `:set iskeyword&`
	- `:set nowrap, sidescroll=10`
	- `:set whichwrap=<>`
		- allow <left> and <right> to move across lines
	- `:set list`, `:set listchars=tab:>,trail:-`
		- display tabs and spaces in text
	- `:set iskeyword`
		- which characters can appear in a word
	- `:set cmdheight=3`
		- for messages
- 6 using syntax highlighting
	- `:set background=` dark/light
		- vim will try to guess terminal background
		- you can override it with above command
			- should go before `:syntax enable` (or `:syntax reset`)
	- `ctrl-l` if colors are wrong
		- (since vim doesn't parse entire file, only region around current text)
	- `:colorscheme evening` (or other)
	- `:highlight Comment ctermfg=green guifg=green`
		- make comments green in color terminal and gui
		- also can do bold, underline
	- `:TOhtml`
		- `:source $VIMRUNTIME/syntax/2html.vim`
- 7 editing more than one file
	- `:e foo.txt`
		- closes current file (if no unsaved changes)
			- `:e! foo.txt` or `:hide edit foo.txt` to override
		- begins editing foo.txt from root
	- `vim file1 file2 file3`
		- `:next`
			- `:next!` to abandon changes
			- `:wnext` to save changes
		- `:args`
		- `:[count]previous`, `:last`, `:first`
	- `:set autowrite`
	- `:args file4 file5 file6`
	- `ctrl-^`
		- alternate file
	- two cool marks
		- `"
			- where cursor was when you left (entered?) the file
		- `.
			- where you made the last change
		- for each buffer
		- remembered on exit
	- uppercase marks are global (`mF`)
	- `:set`
		- `backup`
		- `backupext`
		- `backupdir`
		- `writebackup`
		- `patchmode`
	- `"`
		- specify register for yank, paste...
	- `:write >> logfile`
		- append current file contents to logfile
	- `vim -R view-only-file`
		- warning on edits
	- `vim -M view-only-file`
		- edits forbidden
		- can be undone with
			- `:set modifiable`
			- `:set write`
	- `:saveas foo.txt`
	- `:file foo.txt`
		- moves w/o saving
		- will get error on saving when file exists
- 8 splitting windows
	- `:split [file]`
	- `:close`
		- also `:quit` or `ZZ`
	- `:only`
	- `:new`
	- `:[window line heght]split`
	- `:ctrl-w +/-`
		- increase/decrease size
	- `:ctrl-w _`
		- make a window as high as it can be
	- `'winheight'`, `'winminheight'`
	- `'equalalways'`
		- vim will equalize window sizes when a window is closed or opened
	- `:vsplit [file]`
	- `:vnew`
	- `ctrl-w hjkltb`
		- move to window on left/.../top/bottom
	- `ctrl-w HJKL`
		- move window left-most...
	- `:qall`, `:wall`, `:wqall`, `:qall!`
	- `vim -o/-O foo bar`
		- new window (/vertical) for each file
	- `:all`, `:vertical all`
	- `nvim -d file1 file2`
		- also `:vertical diffsplit file2`
		- `[c`, `]c`
			- previous, next change
		- `:diffupdate` to update diff
		- `dp`
			- diff put (to other window)
		- `do`
			- diff obtain/get (from other window)
	- `zo`
		- open a fold
	- `zc`
		- close a fold
	- `vertical diffpatch file2.diff`
		- file can only contain one patch
		- patch will be applied
	- `:set noscrollbind`
	- `:set laststatus`
	- `:tag`, `:stag`...
	- `ctrl-^`, `ctrl-w ctrl-^`...
	- `'splitbelow'`, `'splitright'`
	- `:aboveleft`, `:belowright`, `:topleft`, `botright`...
	- 8.9 tab pages
	- `:tabedit otherfile`
	- `:tab split`
		- you can put `:tab` b4 any cmd that opens a window
	- `:tabonly`
- 9 Using the gui
- 10 Making big changes
	- recording...
		- `q{reg}`, `q`
		- `@{reg}`
	- `"Ayy`
		- append current line to register a
	- `:[range]s[ubstitute]/from/to/[flags]`
		- eg range = `%` (whole file)
	- flags
		- `g` global
		- `p` print out last line it changes
		- `c` confirm?
			- y, n, a (all), q (exit substituting), l (last)
		- to substitute `/`, use `\/`
			- alternatively, use `:s+one/two+one or two` ('one/two' -> 'one or two')
	- 10.3 command ranges
	- `:1,5s/this/that/g`
	- `.write`
		- write only current line
	- `1,$` = `%`
	- you can also use a search pattern as a range
		- imo easier to just use visual mode..
			- `:'<,'>`
				- colon commands will apply to whole lines!
		- or marks:
			- `mt`, `mb`, `:'t,'b...`
	- `.+3,$-5`
		- offsets
	- `5:` -> `:.,.+4`
	- `[range]g/{pattern}/{cmd}`
		- `{cmd}` must be a command
		- use `norm[!]` for normal commands
	- `:g+//+s/foobar/barfoo/g`
		- replace 'foobar' with 'barfoo' in all lines containing `//`
	- `ctrl-v`
		- `$` is a bit special
			- all lines will extend until the end of the line
			- continued with `j`, `k`, cancelled with `h`, `l`
			- `A` will append at end of every line
		- `I`/`c`
			- if the block spans short lines that don't extent into the block
				- text is not inserted into that line
		- `A`
			- does insert on short lines
		- `C`
			- deletes text from the left end of the block to the end of the line
			- short lines aren't included
		- `~`, `U`, `u`
			- change case
		- `r` fill with one char
		- `>` insert whitespace from left edge for one shift amount
		- `<` removes whitespace
		- `J` join all lines
			- also works with `v` and `V`
		- `gJ` won't change whitespace
	- `:[range]read {from-file}`
		- text put below last line of range
		- `:0read {from-file}`
			- put before first line
		- `:read !ls`
	- `:[range]write [>>]{to-file}`
	- `:set textwidth=78`
	- `gqap`
		- reformat current paragraph
			- line with whitespace does _not_ separate paragraphs!
	- `gggqG`
		- reformat whole file
	- `gqj`
		- format current and next line
	- `gu`, `gU`, `g~`
		- change case
		- operators (expect a motion)
	- `gugu`, `gUgU`, `g~g~`
		- also `guu`, `gUU`, `g~~`
		- change case for current line
	- `:[range]!{motion}{pgm}`
		- filter text thru pgm
		- eg when on L1: `:!5Gsort` will sort first 5 lines
	- `!!`
		- filter current line (eg `!!date` enters date)
			- or `read !date` (will insert new line)
- 11 Recovering from a crash
	- leave this no lazy-nvim lol
- 12 Clever tricks
	- Not super useful, most of these things can be done better with plugins....
- 20 Typing command-line commands quickly
	- `<C-Left>`, `<C-Right>`
		- one word left/right
	- `<C-W>`
		- delete a word
	- `<C-U>`
		- delete all text
	- `ctrl-l`
		- completes word to longest unambiguous string
	- `'wildmode'`, `'wildmenu'`, `'suffixes'`, `'wildignore'`
	- separate histories for
		- `:`
		- `/` and `?`
	- `<up>` completes substrings
		- `<ctrl-p>` goes up but ignores what you already typed
	- `:history`, `:history /`
	- `q:`
- 21 Go away and come back
	- This is handled by LazyVim hopefully...
- 22 Finding the file to edit
	- Netrw (NeoTree is better...)
	- `:cd`, `:pwd`
	- `:lcd` (local directory, for a window)
	- `:tcd` (local directory for a tab)
	- `gf`
		- open file under cursor
		- `:set path+=absolute_or_relative_directory`
		- `:set isfname`
		- `:find [file]`
			- like `:edit`, but also uses `'path'`
		- `ctrl-w f` open in new windoww
	- 22.4 the buffer list
		- active
			- appears in some window
		- hidden
			- not in any window but text loaded
		- inactive
			- not in any window, text not loaded
			- vim still remembers eg marks
		- `:buffers` = `:ls`
			- `u`
				- buffer is not in the buffer list (`:buffers`, `:bnext`, ...)
				- used eg for help files, to remembers file names and marks
				- set with `:bdelete`
				- can be shown with `:ls!`
			- `%`
				- current buffer
			- `#`
				- last file
				- `:keepalt {cmd}` keeps alternate file
				- remembered for each window
			- `a`
				- file loaded and displayed
			- `h`
				- file loaded but hidden (not in any window)