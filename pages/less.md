- opts
	- `-R` raw-control-chars
	- `-i` smart search
	- `-N` line numbers
	- `+F`
		- Another little used feature of less that I found is starting it with  `+F`  as an argument (or hitting SHIFT+F while in less). This causes it to follow the file you've opened, in the same way that  `tail -f <file>`  will. Very handy if you're watching log files from an application, and are likely to want to page back up (if it's generating 100's of lines of logging every second, for instance).
	- `+x` start on line x
- other opts
	- `^W`
		- RAP around the current file.  That  is,  if  the  search reaches  the  end  of  the current file without finding a match, the search continues from the first  line  of  the current file up to the line where it started.
- `~/.lesskey`
	- `#command`
	  `/ forw-search ^W`
	  `? back-search ^W`