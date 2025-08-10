local M = {}

M.setup = function(opts)
  opts = opts or {}
  local groups = require("materscheme.groups").setup(opts)

  for group, setting in pairs(groups) do
    -- Force override any existing links
    vim.api.nvim_set_hl(0, group, setting)
  end

  -- Force refresh
  vim.defer_fn(function()
    if package.loaded["neo-tree"] then
      vim.cmd("silent! Neotree refresh")
    end
  end, 100)
end

return M
