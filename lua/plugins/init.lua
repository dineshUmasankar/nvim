local add = MiniDeps.add
local now = MiniDeps.now
local later = MiniDeps.later

-- Core Infrastructure (Load immediately)
now(function()
    -- Package Manager - needed for other tools
    add({
        source = 'neovim/nvim-lspconfig'
    })

    add({
        source = 'mason-org/mason.nvim',
        checkout = 'v2.1.0'
    })
    add({
        source = 'mason-org/mason-lspconfig.nvim',
        checkout = 'v2.1.0'
    })
    add({
        source = 'WhoIsSethDaniel/mason-tool-installer.nvim',
    })
    add({
        source = 'folke/lazydev.nvim',
    })

    require('mason').setup()
    require('mason-lspconfig').setup()
    require('mason-tool-installer').setup({
        ensure_installed = { 'lua_ls' },
        integrations = {
            ['mason-lspconfig'] = true
        }
    })

    require('lazydev').setup({
        library = {
             { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        }
    })

    -- Notifications - core UI feedback
    add({
        source = 'j-hui/fidget.nvim',
        checkout = 'v1.6.1'
    })

    -- Icons - needed by statusline and files
    add({
        source = 'nvim-mini/mini.icons',
        checkout = 'stable'
    })
    require('mini.icons').setup()
    require('fidget').setup({
        integration = {
            ["nvim-tree"] = { enable = false },
            ["xcodebuild-nvim"] = { enable = false },
        }
    })
end)

-- Visual & UI (Load immediately for consistent experience)
now(function()
    -- Color Scheme
    add({
        source = 'catppuccin/nvim',
        name = 'catppuccin'
    })

    -- Status Line
    add({
        source = 'nvim-mini/mini.statusline',
        checkout = 'stable'
    })

    require('catppuccin').setup({
        flavour = 'mocha',
        default_integrations = false,
        integrations = {
            mini = {
                enabled = true,
                indentscope_color = ""
            }
        }
    })
    vim.cmd.colorscheme('catppuccin')
    require('mini.statusline').setup()
end)

-- Navigation Tools (Can be lazy loaded on first use)
now(function()
    add({
        source = 'nvim-mini/mini.files',
        checkout = 'stable'
    })

    add({
        source = 'nvim-mini/mini.pick',
        checkout = 'stable'
    })

    add({
        source = 'nvim-mini/mini.extra',
        checkout = 'stable'
    })

    require('mini.files').setup({
        content = {
            filter = nil,
            highlight = nil,
            prefix = nil,
            sort = nil,
        },
        mappings = {
            close       = 'q',
            go_in       = 'l',
            go_in_plus  = 'L',
            go_out      = 'h',
            go_out_plus = 'H',
            mark_goto   = "'",
            mark_set    = 'm',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = '=',
            trim_left   = '<',
            trim_right  = '>',
        },
        options = {
            permanent_delete = true,
            use_as_default_explorer = true,
        },
        windows = {
            max_number = math.huge,
            preview = true,
            width_focus = 50,
            width_nofocus = 15,
            width_preview = 85,
        },
    })

    require('mini.pick').setup()
    require('mini.extra').setup()
end)

-- Git Tools (Lazy load - only needed when working with git)
later(function()
    add({
        source = 'nvim-mini/mini-git',
        checkout = 'stable'
    })

    add({
        source = 'nvim-mini/mini.diff',
        checkout = 'stable'
    })

    require('mini.git').setup()
    require('mini.diff').setup({
        view = {
            style = 'sign'
        }
    })
end)

-- Language Support & Parsing (Lazy load for faster startup)
later(function()
    add({
        source = 'nvim-treesitter/nvim-treesitter',
        checkout = 'master',
        monitor = 'main',
        hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
    })

    add({
        source = 'nvim-lua/plenary.nvim',
    })


    add({
        source = 'GustavEikaas/easy-dotnet.nvim',
        checkout = 'main',
        monitor = 'main',
    })

    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'vimdoc', 'vim', 'markdown', 'markdown_inline', 'json', 'helm', 'bicep', 'kusto', 'angular', 'powershell', 'css', 'javascript', 'typescript' },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true, disable = { 'ruby' } },
        autotag = { enable = true },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {}
    })

    require('easy-dotnet').setup({
        lsp = {
            enabled = true,
            roslynator_enabled = true,
            analyzer_assemblies = {},
            config = {},
        },
        auto_bootstrap_namespace = {
            type = 'file_scoped',
            enabled = true,
        },
        diagnostic = {
            setqflist = true,
        },
        picker = "basic"
    })
end)

-- Completion & LSP (Lazy load - heavy and only needed when editing)
later(function()
    add({
        source = 'saghen/blink.cmp',
        checkout = 'v1.8.0'
    })

    -- Configure completion here
    require('blink.cmp').setup({
        keymap = {
            preset = 'none',

            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<Enter>'] = { 'select_and_accept', 'fallback' },

            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
            ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        sources = {
            per_filetype = {
                lua = { 'lazydev' },
                c_sharp = { 'easy-dotnet' },
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                ["easy-dotnet"] = {
                    name = "easy-dotnet",
                    enabled = true,
                    module = "easy-dotnet.completion.blink",
                    score_offset = 1000,
                    async = true,
                },
            }
        },
        signature = { enabled = true },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    })
end)

-- Editing Utilities (Lazy load)
later(function()
    add({
        source = 'tpope/vim-sleuth',
        checkout = 'master'
    })
    -- vim-sleuth doesn't need explicit setup
end)

