return {
  {
    "snacks.nvim",
    opts = {
      indent = {
        scope = { enabled = false },
      },
      picker = {
        sources = {
          files = {
            -- Show hidden and Git-ignored files in the file picker.
            hidden = true,
            ignored = true,
          },
          explorer = {
            -- Show hidden and Git-ignored files in the explorer.
            hidden = true,
            ignored = true,
            actions = {
              -- Open the selected file and remove the previous hidden buffer when safe.
              explorer_replace = function(picker, item, action)
                local old_buf = vim.api.nvim_win_get_buf(picker.main)
                require("snacks.explorer.actions").actions.confirm(picker, item, action)

                -- Keep special, modified, or still-visible buffers open.
                if
                  vim.api.nvim_buf_is_valid(old_buf)
                  and vim.bo[old_buf].buftype == ""
                  and not vim.bo[old_buf].modified
                  and #vim.fn.win_findbuf(old_buf) == 0
                then
                  Snacks.bufdelete({ buf = old_buf })
                end
              end,
            },
            win = {
              list = {
                keys = {
                  -- Use the replacement behavior when opening a file with Enter.
                  ["<CR>"] = "explorer_replace",
                },
              },
            },
          },
        },
      },
      words = { enabled = false },
    },
  },
}
