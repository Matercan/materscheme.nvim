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
    Normal = { bg = colors.bg, fg = colors.fg },
    NormalFloat = { bg = colors.bg, fg = colors.fg },

    --Treesitter
    ["@string"] = { fg = colors.string },
    ["@variable"] = { fg = colors.variable },
    ["@parameter"] = { fg = colors.parameter },

  }
end

return M
