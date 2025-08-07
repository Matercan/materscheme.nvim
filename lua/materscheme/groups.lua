local M = {}

local colors = require("materscheme.palette")

M.setup = function()
  return {

    -- Standard
    Comment = { fg = colors.comment, italic = true },
    Keyword = { fg = colors.keyword, italic = true },

    --Treesitter
    ["@string"] = { fg = colors.string }

  }
end

return M
