local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        -- go = { "gofmt" },
        -- go = { "gopls" },
    },
    formatters = {
        -- cpp
        ["clang-format"] = {
            prepend_args = {
            --     "-style={ \
            --     BasedOnStyle: google, \
            --     IndentWidth: 2, \
            --     TabWidth: 2, \
            --     UseTab: Never, \
            --     AccessModifierOffset: 0, \
            --     IndentAccessModifiers: true, \
            --     PackConstructorInitializers: Never}",
            },
        },
        -- javascript
        ["prettier"] = {
            prepend_args = {
                "--tab-width",
                "4",
                "--use-tabs",
                "false",
                "--single-quote",
                "true",
                "--trailing-comma",
                "all",
            },
        },
        -- Python
        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "80",
            },
        },
    },
    format_on_save = false,
    -- format_on_save = {
    --     -- These options will be passed to conform.format()
    --     timeout_ms = 500,
    --     lsp_fallback = true,
    -- },
}

return options
