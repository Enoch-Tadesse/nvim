return {
    {
        { import = "configs.java" },
    },
    -- {
    --     "mfussenegger/nvim-jdtls",
    --     ft = { "java" },
    --     config = function()
    --         require "configs.jdtls"
    --     end,
    -- },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = false, -- or event = "VeryLazy" if you want deferred loading
        config = function()
            require "configs.mason"
        end,
    },

    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread", "Glog" }, -- optional lazy loading
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        lazy = false,
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            local cmp = require "cmp"
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show { global = false }
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        "numToStr/FTerm.nvim",
        config = function()
            require "configs.terminal"
        end,
    },

    {
        "echasnovski/mini.indentscope",
        event = "BufEnter",
        version = false, -- Use latest commit
        config = function()
            require "configs.indentscope"
        end,
    },

    {
        "A7lavinraj/assistant.nvim",
        lazy = false,
        enabled = true,
        keys = {
            { "<leader>a", "<cmd>Assistant<cr>", desc = "Assistant.nvim" },
        },
        opts = {
            ui = {
                border = "single",
                diff_mode = true,
            },
        },
    },

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.dressing").setup()
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require "luasnip"

            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Load custom Lua-based snippets
            require("luasnip.loaders.from_lua").lazy_load { paths = "~/.config/nvim/lua/snippets" }
            vim.api.nvim_set_keymap("i", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })
            vim.api.nvim_set_keymap("s", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })

            vim.api.nvim_set_keymap("i", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })
            vim.api.nvim_set_keymap("s", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })
        end,
    },

    {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            local cmp = require "cmp"
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            require "configs.nvim-cmp"
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require "configs.mason-conform"
        end,
    },

    {
        "stevearc/conform.nvim",
        -- event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format { async = true, lsp_format = "fallback" }
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require "configs.mason-lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "configs.treesitter"
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        cmd = "Telescope", -- Lazy-load on :Telescope command
        lazy = false,
        keys = {
            {
                "<leader>th",
                function()
                    require("theme_picker").open()
                end,
                desc = "Pick Theme",
            },
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require "configs.telescope"
        end,
    },

    {
        "numToStr/FTerm.nvim",
        config = function()
            require "configs.terminal"
        end,
    },

    -- {
    --     -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    --     -- used for completion, annotations and signatures of Neovim apis
    --     "folke/lazydev.nvim",
    --     ft = "lua",
    --     opts = {
    --         library = {
    --             -- Load luvit types when the `vim.uv` word is found
    --             { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --         },
    --     },
    -- },
}
