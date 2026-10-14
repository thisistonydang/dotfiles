return {
  {
    "mattn/emmet-vim",
    ft = {
      "astro",
      "css",
      "html",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "svelte",
      "typescriptreact",
      "vue",
    },
    init = function()
      -- Expand Emmet abbreviations with `,,` instead of the default `<C-y>,`.
      vim.g.user_emmet_leader_key = ","
    end,
  },
}
