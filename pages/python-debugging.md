- pysnooper
  title:: python-debugging
	- ```python
	  @pysnooper.snoop(
	      "foo.ansi",
	      depth=int(1e18),
	      prefix="ZZZ",
	      normalize=True,
	      max_variable_length=200,
	      relative_time=True,
	  )  # pyright: ignore [reportUntypedFunctionDecorator]
	  ```
	- doesn't show locals for last function call (the one where the exception happened)
	- 4 flows, 25 trasactions:
		- 147 s with pysnooper (infinite depth)
		- 0.84 s without pysnooper
- snoop
	- limitations
		- also doesn't show last context
		- doesn't work with state assignments
			- https://github.com/cool-RR/PySnooper/issues/7
		- doesn't show subexpressions
- pysnooper
	- same limitations as snoop :(
- todo:
	- pdb++
- (i)python & (i)pdb (the rest of this document)
	- section was written linearly
- `p ipython --pdb -m contracts.fuzz_tests` (p == pdm run)
	- jumps to exception location
	- prompt shows `ipdb`
	- `s` exits
	- no syntax highlighting
	- `w` (where?) and `l` are much nicer
		- i _dont_ think this is because of rich...
	- https://wangchuan.github.io/coding/2017/07/12/ipdb-cheat-sheet.html
	- `import pdb; ...; pdb.set_trace()`
		- jumps to this location
		- prompt shows `(Pdb)`
		- evaluation is possible (`1+1` prints 2)
		- `locals()` is not formatted / pretty-printed
		- `p s` prints repr of `s` (self)
			- ...
		- `^d` - exits (and then launches ipdb on the exception much later on)
- `p ipython -m contracts.fuzz_tests` (w/o `--pdb`)
	- also launches `pdb` on exception
	- but then doesn't launch exception
- changing `pdb.set_trace()` to `IPython.embed()`
	- jumps to ipython shell
	- looks more ipythony
		- In, Out
		- confirm on `^d`
		- BUT no syntax highlighting
	- no (i)pdb commands (s, n, p, u, d, w, l, a, b, r, j (like b?))
	- changing back to `--pdb`
		- behavior as expected:
			- first it launches ipython embed (see above)
			- then (at exception) it launches `ipdb`
- also can use `IPython.embed()`
	- running it with `p line-fuzz-tests`:
		- ipython is embedded, then exits (with exception) later on
		- `%debug`
			- `ERROR:root:No traceback has been produced, nothing to debug.`
- `ipdb.set_trace` w/o running ipython
- `inspect.currentframe()`
	- f_back
		- Frame
	- f_builtins
		- zip
		- `__debug__` True
		- ...
	- f_code
		- `<code object __enter__ at 0x1051e1190, file ".../isnoop.py", line 10>`
		- in `__enter__` (L14) on L20:
		- co_argcount 1
		- co_cellvars ()
		- co_code bytes
		- co_consts `(None, True, ('methods', 'help', 'all'))`
		- co_filename `'.../snoop.py`
		- co_firstlineno 14
		- co_flags 67
		- co_freevars ()
		- co_kwonlyargcount 0
		- co_lnotab bytes
		- co_name `__enter__`
		- co_names `('cast', 'FrameType', 'inspect', 'currentframe', 'rich', 'f_code')`
		- co_nlocals 2
		- co_posonlyargcount 0
		- co_stacksize 6
		- co_varnames `('self', 'frame')`
		- replace # Return a copy of the code object with new values for the specified fields.
	- f_globals
		- ...
	- f_lasti 18
	- f_lineno 12
	- f_locals
		- self
		- frame
	- f_trace None
	- f_trace_lines True
	- f_trace_opcodes False
	- clear # clear most references held by the frame
- sys.gettrace()
	- None...
- sys.settrace(trace)
	- takes
		- frame
		- event
			- line
			- call
			- return
		- arg
			- only non-None for return?