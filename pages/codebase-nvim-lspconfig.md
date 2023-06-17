- #codebase-notes
- ---
- plugin/lspconfig.lua
	- api, lsp = vim.api, vim.lsp
- lua
	- lspconfig/server_configurations
		- a bunch of configs
			- e.g. sumneko_lua.lua
				- return
					- cm
- ---
- lua/lspconfig.lua
	- configs = req lspconfig.configs
	- server-alias( `name` )
		- aliases = {}
			- fennel-ls -> fennel_ls
			- starlark-rust -> starlark_rust
			- sumneko_lua -> lua_ls
		- ret aliases[ `name` ]
	- M = { util = req lspconfig.util }
		- when M is accessed with `name`, return configs[`name`]. If it doesn't exist:
			- if it's in server-alias, deprecate
			- find in `server-configurations`, add to `configs`
				- cache?
			- if cannot be found, return `{ setup = function() end }`
- configs.lua
	- util = req lspconfig.util
	- api, validate, lsp, uv, fn = vim....
	- tbl_deep_extend
	- configs = {}
		- when configs gets new index
			- validate
	-