require "nvchad.autocmds"

vim.schedule(function()
  local ok, watcher = pcall(vim.uv.new_fs_event)
  if not ok or not watcher then return end

  local theme_file = vim.fn.expand "~/.config/nvim/lua/themes/matugen.lua"
  if vim.fn.filereadable(theme_file) ~= 1 then return end

  local timer
  watcher:start(theme_file, {}, vim.schedule_wrap(function(err)
    if err then return end
    if timer then timer:stop() end
    timer = vim.defer_fn(function()
      package.loaded["themes.matugen"] = nil
      pcall(require("base46").load_all_highlights)
    end, 200)
  end))
end)
