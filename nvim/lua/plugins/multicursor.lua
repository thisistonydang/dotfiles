return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      -- Select the next matching word or visual selection, like other editors.
      vim.keymap.set({ "n", "x" }, "<C-d>", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor at next match" })

      -- These mappings apply only while multiple cursors are active.
      mc.addKeymapLayer(function(set)
        set("n", "<Esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
}
