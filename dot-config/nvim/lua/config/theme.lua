vim.api.nvim_create_user_command("SwitchTheme", function(opts)
  local theme = opts.args:lower()

  if theme == "dark" then
    vim.api.nvim_set_option_value("background", "dark", {})
    vim.cmd("colorscheme github_dark") -- pick your dark theme
  elseif theme == "light" then
    vim.api.nvim_set_option_value("background", "light", {})
    vim.cmd("colorscheme github_light") -- or any light theme
  else
    vim.notify("Unknown theme: " .. opts.args, vim.log.levels.ERROR)
  end
end, {
  nargs = 1,
  complete = function()
    return { "dark", "light" }
  end,
})

vim.schedule(function()
  local bg = vim.o.background
  if bg == "dark" then
    vim.cmd("SwitchTheme dark")
  elseif bg == "light" then
    vim.cmd("SwitchTheme light")
  end
end)
