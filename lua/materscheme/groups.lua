local M = {}

local colors = require("materscheme.palette")

M.setup = function()
  return {

    -- Standard
    Comment = { fg = colors.comment, italic = true },
    Keyword = { fg = colors.keyword, italic = true },
    Identifier = { fg = colors.identifier },
    Property = { fg = colors.property },
    Variable = { fg = colors.variable },

    --Treesitter
    ["@string"] = { fg = colors.string }

  }
end

return M
