--general
--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- general
lvim.lsp.diagnostics.virtual_text = false
lvim.format_on_save               = true
lvim.colorscheme                  = "tokyonight-night"
-- mo disable icons and use a minimalist setup, uncomment the following
lvim.use_icons                    = true
vim.opt.timeoutlen                = 200
lvim.log.level                    = "warn"

-- keymappings [view all the defaults by pressing <leader>Lk]
--keymap.lua
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

lvim.leader = "space"
-- add your own keymapping
-- change to current directory
lvim.keys.normal_mode["cd"] = ":set autochdir<cr>"
--move to previous direction
lvim.keys.normal_mode["dc"] = ":cd ..<cr>"


lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
--change leader to space
lvim.keys.normal_mode["-"] = "<C-x>"


--for undo and redo
lvim.keys.normal_mode["zz"] = ":redo<cr>"

--increment/decrement
lvim.keys.normal_mode["+"] = "<C-a>"

--delete a word backwards
lvim.keys.normal_mode["dw"] = 'vb"_d'

--select all
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

--new/remove tab and split windows
lvim.keys.normal_mode["te"] = ":tabedit<cr>"
lvim.keys.normal_mode["sd"] = ":split<cr><C-w>w"
lvim.keys.normal_mode["sn"] = ":vsplit<cr><C-w>w"
lvim.keys.normal_mode["tr"] = ":bd<cr>"


-- --resize windows
-- map.set('n', '<C-w><left>', '<C-w><')
-- map.set('n', '<C-w><right>', '<C-w>>')
-- map.set('n', '<C-w><up>', '<C-w>+')
-- map.set('n', '<C-w><down>', '<C-w>-')


--+move left, down, up, right between windows
--move orderly
lvim.keys.normal_mode["ww"] = "<C-w>w"
--left
lvim.keys.normal_mode["sh"] = "<C-w>h"
--down
lvim.keys.normal_mode["sj"] = "<C-w>j"
--up
lvim.keys.normal_mode["sk"] = "<C-w>k"
--right
lvim.keys.normal_mode["sl"] = "<C-w>l"
--with arrows
--ltft
lvim.keys.normal_mode["<left>"] = "<C-w>h"
--down
lvim.keys.normal_mode["<down>"] = "<C-w>j"
--up
lvim.keys.normal_mode["<up>"] = "<C-w>k"
--right
lvim.keys.normal_mode["<right>"] = "<C-w>l"


--for move line
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm<cr>"


--PLUGINS
lvim.builtin.terminal.active = true
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm direction=float dir=%:p:h<cr>", "Float terminal" },
  h = { "<cmd>ToggleTerm direction=horizontal dir=%:p:h<cr>", "Horizontal terminal" }
}
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.update_focused_file.enable = true
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "json",
  "lua",
  "python",
  "css",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight = {
  enable = true,
  disable = { "c", "rust", "html" }
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.indent.enable = false


-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  -- "sumneko_lua",
  "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

--color highlight
require("nvim-highlight-colors").turnOn()
-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
--vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = { -- check the lspconfig documentation for a list of all possible options}
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- -- you can set a custom on_attach function that will be used for all the language servers
-- -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end

--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "autopep8", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   --     ---@usage arguments to pass to the formatter
  --   --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "html", "css" },
  -- },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     --     ---@usage arguments to pass to the formatter
--     --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }



-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "shatur/neovim-ayu" --ayu theme
  },
  {
    "dracula/vim" --dracula
  },
  {
    "EdenEast/nightfox.nvim" --nightfox
  },
  {
    "navarasu/onedark.nvim" --onedarker
  },
  {
    "lunarvim/horizon.nvim" --horizon
  },
  {
    "lunarvim/synthwave84.nvim" --synthwave84
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    "sainnhe/sonokai"
  },
  {
    "junegunn/seoul256.vim"
  },
  {
    "lunarvim/colorschemes"
  },
  {
    "brenoprata10/nvim-highlight-colors"
  },
  {
    "christoomey/vim-tmux-navigator"
  }



}
