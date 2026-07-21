return {
    "nvim-telescope/telescope.nvim",

    version = "*",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-a>'] = require('telescope.actions').toggle_all,
                        ['<C-x>'] = require('telescope.actions').drop_all,
                        -- ["<C-S-n>"] = require('telescope.actions').results_scrolling_left,
                        -- ["<C-S-o>"] = require('telescope.actions').results_scrolling_right,
                        ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
                        ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                    },
                },
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        preview_width = 0.6
                    }
                }
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            -- builtin.grep_string({ search = vim.fn.input("Grep > ") })
            builtin.live_grep({})
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
