vim.keymap.set("n", "<leader>md", function()
  if vim.fn.executable("leaf") ~= 1 then
    vim.notify("leaf executable was not found", vim.log.levels.ERROR)
    return
  end

  if vim.fn.executable("wezterm") ~= 1 then
    vim.notify("wezterm executable was not found", vim.log.levels.ERROR)
    return
  end

  local file = vim.fn.expand("%:p")

  if file == "" then
    vim.notify("Save the file before opening leaf", vim.log.levels.WARN)
    return
  end

  local job = vim.fn.jobstart({
    "wezterm",
    "cli",
    "spawn",
    "--cwd",
    vim.fn.fnamemodify(file, ":h"),
    "--",
    "leaf",
    file,
  }, { detach = true })

  if job <= 0 then
    vim.notify("Failed to open leaf in WezTerm", vim.log.levels.ERROR)
  end
end, {
  buffer = true,
  desc = "Open Markdown in leaf",
})
