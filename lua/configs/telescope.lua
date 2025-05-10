local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
        file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
    },
    pickers = {
        find_files = { hidden = true },
    },
    extensions = {},
}

-- Keybindings
local keymap = vim.keymap.set
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })
---------------git bindingss ----------------
keymap("n", "<leader>tgc", ":Telescope git_commits<CR>", { noremap = true, silent = true })
keymap("n", "<leader>tgb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
keymap("n", "<leader>tgs", ":Telescope git_status<CR>", { noremap = true, silent = true })
keymap("n", "<leader>tgS", ":Telescope git_stash<CR>", { noremap = true, silent = true })

return telescope
