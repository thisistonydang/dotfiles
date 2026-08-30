-- Follow the macOS light/dark appearance and switch the colorscheme with it.
--
-- We deliberately do NOT use `defaults read -g AppleInterfaceStyle` (what the
-- auto-dark-mode.nvim plugin uses): on this machine that value is cached and
-- never updates when the system theme is toggled. Querying System Events via
-- `osascript` reports the real appearance, so we poll that every 2 seconds.
do
  local uv = vim.uv or vim.loop
  local last ---@type string?

  local function apply(want)
    if want == last then
      return -- no change, avoid reloading the colorscheme
    end
    last = want
    vim.o.background = want
    vim.cmd.colorscheme("rose-pine")
  end

  local function poll()
    vim.system(
      { "osascript", "-e", 'tell application "System Events" to tell appearance preferences to get dark mode' },
      { text = true },
      function(res)
        local out = res.stdout or ""
        local want
        if out:match("true") then
          want = "dark"
        elseif out:match("false") then
          want = "light"
        else
          return -- error / unexpected output: leave the theme as-is
        end
        vim.schedule(function()
          apply(want)
        end)
      end
    )
  end

  poll() -- set the correct theme at startup
  local timer = uv.new_timer()
  timer:start(2000, 2000, function()
    poll()
  end)
end
