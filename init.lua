return {
  -- {
  --   "nvzone/typr",
  --   dependencies = "nvzone/volt",
  --   cmd =  { "Typr", "TyprStats"},
  --   opts = { wpm_goal = 100, winlayout = 'vertical' },
  -- },

  { "nvchad/ui", lazy = true },
  { "nvzone/volt", lazy = true },
  { "nvchad/menu", lazy = true },
  { "nvzone/minty", lazy = true },
  { "nvchad/base46", lazy = true },

  -- { "nvzone/timerly", cmd = "TimerlyToggle" },

  { "nvzone/showkeys", cmd = "ShowkeysToggle",
    opts = {
      position = "bottom-right",
      maxkeys = 5,
      -- show_count = true,
    },
  },

  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    cmd = {
      'RenderMarkdown',
    },
    opts = {},
  },

  -- {
  --   "S1M0N38/love2d.nvim",
  --   cmd = "LoveRun",
  --   opts = { },
  --   keys = {
  --     { "<leader>v", ft = "lua", desc = "LÖVE" },
  --     { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
  --     { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
  --   },
  -- },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        notify = {
          enabled = false,
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          hover = {
            enabled = true,
          },
          signature = {
            enabled = false,
          },
          message = {
            enabled = true,
          },
          progress = {
            enabled = true,
          },
          -- documentation = {
          --   view = "hover",
          -- --   opts = {
          -- --     lang = "markdown",
          -- --     replace = true,
          -- --     render = "plain",
          -- --     format = { "[message]" },
          -- --     win_options = { concealcursor = "n", conceallevel = 3 },
          -- --   },
          -- },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
      })
    end,
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      commit = "8d3bce9764e627b62b07424e0df77f680d47ffdb",
      -- { "pynappo/nui.nvim", branch = "support-winborder" },
      -- OPTIONAL:
      -- `nvim-notify`is only needed, if you want to use the notification view.
      -- If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    --@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      -- explorer = { enabled = true }, -- new
      -- image = { enabled = false }, -- new
      indent = { enabled = true },
      input = { enabled = true },
      -- picker = { enabled = true }, -- new
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      -- terminal = {
      --   enabled = true,
      --   win = {
      --     style = "terminal",
      --     wo = {
      --       winbar = "",
      --     },
      --     keys = {
      --       q = "hide",
      --     },
      --     -- size = {
      --     --   height = 0.2,
      --     -- },
      --     -- relative = "editor",
      --     -- width = 0.8,
      --     -- height = 0.2,
      --     -- row = 1,
      --     -- col = 1,
      --     -- border = "rounded",
      --   },
      -- },
      words = { enabled = true },
    },
    -- keys = {
    -- --   { "<leader>tg", function() Snacks.terminal.get() end, desc = "Get Terminal" },
    --   { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
    -- --   { "<leader>tl", function() Snacks.terminal.list() end, desc = "List Terminals" },
    -- --   { "<leader>to", function() Snacks.terminal.open() end, desc = "Open New Terminal" },
    -- },
  },


  {
    "sphamba/smear-cursor.nvim",
    opts = {                         -- Default  Range
      stiffness = 0.8,               -- 0.6      [0, 1]
      trailing_stiffness = 0.5,      -- 0.3      [0, 1]
      distance_stop_animating = 0.5, -- 0.1      > 0
      hide_target_hack = true,      -- true     boolean
      -- if you have transparent background it FUCKS everything up
      cursor_color = "none",
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      legacy_computing_symbols_support = true,
    },
    lazy = false,
  },






  {
    "barrett-ruth/live-server.nvim",
    build = 'npm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop'},
    config = true
  },


  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  {
    "mfussenegger/nvim-jdtls",
	  lazy = false,
  },

  {
    "MunifTanjim/nui.nvim",
  },

  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = true,
  --         auto_refresh = false,
  --         keymap = {
  --           jump_prev = "[[",
  --           jump_next = "]]",
  --           accept = "<CR>",
  --           refresh = "gr",
  --           open = "<M-CR>",
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right | horizontal | vertical |
  --           ratio = 0.4,
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = false,
  --         hide_during_completion = true,
  --         debounce = 75,
  --         keymap = {
  --           accept = "<M-1>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         javascript = true,
  --         typescript = true,
  --         python = true,
  --         java = true,
  --         c = true,
  --         cpp = true,
  --         go = true,
  --         haskell = true,
  --         yaml = false,
  --         markdown = false, -- overrides default
  --         help = false,
  --         gitcommit = false,
  --         gitrebase = false,
  --         hgcommit = false,
  --         svn = false,
  --         cvs = false,
  --         ["."] = false,
  --         terraform = false, -- disallow specific filetype
  --         sh = function ()
  --           if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
  --             -- disable for .env files
  --             return false
  --           end
  --           return true
  --         end,
  --       },
  --       copilot_node_command = 'node',
  --       server_opts_overrides = {
  --         trace = "verbose",
  --         settings = {
  --           advanced = {
  --             listCount = 10, -- #completions for panel
  --             inlineSuggestCount = 3, -- #completions for getCompletions
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
  --   opts = {
  --     -- add any opts here
  --     provider = 'copilot',
  --     auto_suggestions_provider = "copilot",
  --     copilot = {
  --       model = 'claude-3.5-sonnet',
  --     },
  --     behaviour = {
  --       auto_suggestions = false, -- Experimental stage
  --       auto_set_highlight_group = true,
  --       auto_set_keymaps = true,
  --       auto_apply_diff_after_generation = false,
  --       support_paste_from_clipboard = false,
  --       minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
  --     },
  --     mappings = {
  --       --- @class AvanteConflictMappings
  --       diff = {
  --         ours = "co",
  --         theirs = "ct",
  --         all_theirs = "ca",
  --         both = "cb",
  --         cursor = "cc",
  --         next = "]x",
  --         prev = "[x",
  --       },
  --       suggestion = {
  --         accept = "<M-l>",
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --         dismiss = "<C-]>",
  --       },
  --       jump = {
  --         next = "]]",
  --         prev = "[[",
  --       },
  --       submit = {
  --         normal = "<CR>",
  --         insert = "<C-s>",
  --       },
  --       sidebar = {
  --         apply_all = "A",
  --         apply_cursor = "a",
  --         switch_windows = "<Tab>",
  --         reverse_switch_windows = "<S-Tab>",
  --       },
  --     },
  --     hints = { enabled = true },
  --     windows = {
  --       ---@type "right" | "left" | "top" | "bottom"
  --       position = "right", -- the position of the sidebar
  --       wrap = true, -- similar to vim.o.wrap
  --       width = 30, -- default % based on available width
  --       sidebar_header = {
  --         enabled = true, -- true, false to enable/disable the header
  --         align = "center", -- left, center, right for title
  --         rounded = true,
  --       },
  --       input = {
  --         prefix = "> ",
  --         height = 8, -- Height of the input window in vertical layout
  --       },
  --       edit = {
  --         border = "rounded",
  --         start_insert = true, -- Start insert mode when opening the edit window
  --       },
  --       ask = {
  --         floating = false, -- Open the 'AvanteAsk' prompt in a floating window
  --         start_insert = true, -- Start insert mode when opening the ask window
  --         border = "rounded",
  --         ---@type "ours" | "theirs"
  --         focus_on_apply = "ours", -- which diff to focus after applying
  --       },
  --     },
  --     highlights = {
  --       ---@type AvanteConflictHighlights
  --       diff = {
  --         current = "DiffText",
  --         incoming = "DiffAdd",
  --       },
  --     },
  --     --- @class AvanteConflictUserConfig
  --     diff = {
  --       autojump = true,
  --       ---@type string | fun(): any
  --       list_opener = "copen",
  --       --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
  --       --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
  --       --- Disable by setting to -1.
  --       override_timeoutlen = 500,
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     -- {
  --     --   -- support for image pasting
  --     --   "HakonHarnes/img-clip.nvim",
  --     --   event = "VeryLazy",
  --     --   opts = {
  --     --     -- recommended settings
  --     --     default = {
  --     --       embed_image_as_base64 = false,
  --     --       prompt_for_file_name = false,
  --     --       drag_and_drop = {
  --     --         insert_mode = true,
  --     --       },
  --     --       -- required for Windows users
  --     --       use_absolute_path = true,
  --     --     },
  --     --   },
  --     -- },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },


  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"

      -- configure diagnostics globally
      vim.diagnostic.config({
        --virtual_text = false, -- disable virtual text
        virtual_text = { spacing = 2, prefix = '●', source = "if_many", },
        signs = true, --enable signs in the sign column
        underline = true, -- underline problematic code
        --update_in_insert = false, --don't update diagnostics in insert mode
        update_in_insert = true,
        severity_sort = true, -- sort diagnostics by severity
        float = { border = "rounded" }, --use rounded borders for floating windows
      })
    end,
  },


  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  		  "vim", "lua", "vimdoc",
        "html", "css", "java"
  		},
  	},
  },

}
