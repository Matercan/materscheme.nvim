-- In your actual groups.lua file, replace the content with:
local M = {}
local paletteColors = require("materscheme.palette")

-- Helper function to ensure background is always applied
local function ensure_background(groups, bg_color, line_nr_color)
  if not bg_color then return groups end

  -- Core background groups that should always have background
  local bg_groups = {
    "Normal", "NormalNC", "NormalFloat",
    -- Line numbers and signs
    "LineNr", "LineNrAbove", "LineNrBelow", "CursorLineNr", "SignColumn", "FoldColumn",
    -- NeoTree groups
    "NeoTree", "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
    "NeoTreeWinSeparator", "NeoTreeCursorLine", "NeoTreeDirectoryName",
    "NeoTreeDirectoryIcon", "NeoTreeFileName", "NeoTreeFileIcon",
    "NeoTreeIndentMarker", "NeoTreeExpander", "NeoTreeGitAdded",
    "NeoTreeGitConflict", "NeoTreeGitDeleted", "NeoTreeGitIgnored",
    "NeoTreeGitModified", "NeoTreeGitUnstaged", "NeoTreeGitUntracked", "NeoTreeGitStaged",
    -- Additional UI elements
    "StatusLine", "StatusLineNC", "WinSeparator", "VertSplit", "EndOfBuffer"
  }

  for _, group in ipairs(bg_groups) do
    if groups[group] then
      groups[group].bg = bg_color
      -- Special handling for line numbers - they need fg color too
      if group:match("LineNr") or group == "SignColumn" or group == "FoldColumn" then
        if not groups[group].fg then
          groups[group].fg = line_nr_color
        end
      end
    else
      if group:match("LineNr") or group == "SignColumn" or group == "FoldColumn" then
        groups[group] = { bg = bg_color, fg = line_nr_color }
      else
        groups[group] = { bg = bg_color }
      end
    end
  end

  return groups
end

-- Helper function to ensure C keywords and conditionals are properly highlighted
local function ensure_c_keywords(groups, keyword_color)
  if not keyword_color then return groups end

  local c_keyword_groups = {
    "cConditional", "cRepeat", "cStatement", "cKeyword", "cType", "cStorageClass",
    "cStructure", "cOperator", "cPreProc", "cDefine", "cInclude", "cPreCondit",
    "cBlock", "cBrace", "cParen", "cBracket", "cLabel", "cUserLabel",
    "cConstant", "cSpecial", "cFormat", "cCppString",
  }

  for _, group in ipairs(c_keyword_groups) do
    if groups[group] then
      groups[group].fg = keyword_color
    else
      groups[group] = { fg = keyword_color }
    end
  end

  return groups
end

M.setup = function(opts)
  opts = opts or {}
  local colors = opts.colors or paletteColors

  -- Core highlight groups with comprehensive treesitter support
  local groups = {
    -- Basic vim groups
    Comment = { fg = colors.comment, italic = true },
    Keyword = { fg = colors.keyword, italic = true },
    Identifier = { fg = colors.identifier },
    Property = { fg = colors.property },
    Variable = { fg = colors.variable },
    Function = { fg = colors.Function },
    String = { fg = colors.string },
    Constant = { fg = colors.constant },
    Type = { fg = colors.type },
    Number = { fg = colors.number },
    Boolean = { fg = colors.boolean },
    Operator = { fg = colors.operator },
    Normal = { bg = colors.bg, fg = colors.fg },
    NormalFloat = { bg = colors.bg, fg = colors.fg },

    -- Comprehensive Treesitter support
    ["@variable"] = { fg = colors.variable },
    ["@variable.builtin"] = { fg = colors.keyword },
    ["@variable.parameter"] = { fg = colors.parameter },
    ["@variable.member"] = { fg = colors.property },
    ["@field"] = { fg = colors.property },
    ["@function"] = { fg = colors.Function },
    ["@function.builtin"] = { fg = colors.keyword },
    ["@function.method"] = { fg = colors.Function },
    ["@function.call"] = { fg = colors.Function },
    ["@string"] = { fg = colors.string },
    ["@string.documentation"] = { fg = colors.comment },
    ["@string.regex"] = { fg = colors.string },
    ["@string.escape"] = { fg = colors.constant },
    ["@character"] = { fg = colors.string },
    ["@character.special"] = { fg = colors.constant },
    ["@number"] = { fg = colors.number },
    ["@number.float"] = { fg = colors.number },
    ["@boolean"] = { fg = colors.boolean },
    ["@constant"] = { fg = colors.constant },
    ["@constant.builtin"] = { fg = colors.constant },
    ["@constant.macro"] = { fg = colors.constant },
    ["@type"] = { fg = colors.type },
    ["@type.builtin"] = { fg = colors.type },
    ["@type.definition"] = { fg = colors.type },
    ["@attribute"] = { fg = colors.keyword },
    ["@namespace"] = { fg = colors.type },
    ["@symbol"] = { fg = colors.identifier },
    ["@keyword"] = { fg = colors.keyword },
    ["@keyword.function"] = { fg = colors.keyword, italic = true },
    ["@keyword.operator"] = { fg = colors.operator, italic = true },
    ["@keyword.return"] = { fg = colors.keyword, italic = true },
    ["@keyword.conditional"] = { fg = colors.keyword, italic = true },
    ["@keyword.repeat"] = { fg = colors.keyword, italic = true },
    ["@keyword.exception"] = { fg = colors.keyword, italic = true },
    ["@keyword.import"] = { fg = colors.keyword, italic = true },
    ["@keyword.storage"] = { fg = colors.keyword, italic = true },
    ["@operator"] = { fg = colors.operator },
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.operator },
    ["@comment"] = { fg = colors.comment, italic = true },
    ["@comment.documentation"] = { fg = colors.comment, italic = true },
    ["@markup.strong"] = { fg = colors.keyword, bold = true },
    ["@markup.emphasis"] = { fg = colors.keyword, italic = true },
    ["@markup.heading"] = { fg = colors.Function, bold = true },
    ["@markup.link"] = { fg = colors.constant },
    ["@markup.link.url"] = { fg = colors.string },
    ["@tag"] = { fg = colors.keyword },
    ["@tag.attribute"] = { fg = colors.property },
    ["@tag.delimiter"] = { fg = colors.operator },

    -- LSP Semantic Tokens (higher priority than treesitter)
    ["@lsp.type.variable"] = { fg = colors.variable },
    ["@lsp.type.field"] = { fg = colors.property },
    ["@lsp.type.parameter"] = { fg = colors.parameter },
    ["@lsp.type.function"] = { fg = colors.Function },
    ["@lsp.type.method"] = { fg = colors.Function },
    ["@lsp.type.keyword"] = { fg = colors.keyword },
    ["@lsp.type.type"] = { fg = colors.type },
    ["@lsp.type.class"] = { fg = colors.type },
    ["@lsp.type.struct"] = { fg = colors.type },
    ["@lsp.type.interface"] = { fg = colors.type },
    ["@lsp.type.enum"] = { fg = colors.type },
    ["@lsp.type.namespace"] = { fg = colors.type },
    ["@lsp.type.string"] = { fg = colors.string },
    ["@lsp.type.number"] = { fg = colors.number },
    ["@lsp.type.boolean"] = { fg = colors.boolean },
    ["@lsp.type.constant"] = { fg = colors.constant },
    ["@lsp.type.comment"] = { fg = colors.comment, italic = true },
    ["@lsp.type.operator"] = { fg = colors.operator },
  }

  local bg_color = colors.bg or opts.background or "#000000"
  local keyword_color = colors.keyword or opts.keyword or "#ff6b6b"
  local line_nr_color = colors.linenr or opts.line_nr or "#666666"

  -- Apply fixes
  groups = ensure_background(groups, bg_color, line_nr_color)
  groups = ensure_c_keywords(groups, keyword_color)

  -- Additional treesitter support for C
  if vim.fn.has('nvim-0.8') == 1 then
    local ts_groups = {
      ["@keyword.conditional.c"] = { fg = keyword_color },
      ["@keyword.repeat.c"] = { fg = keyword_color },
      ["@keyword.return.c"] = { fg = keyword_color },
      ["@keyword.c"] = { fg = keyword_color },
      ["@type.c"] = { fg = keyword_color },
      ["@type.builtin.c"] = { fg = keyword_color },
      ["@storageclass.c"] = { fg = keyword_color },
      ["@structure.c"] = { fg = keyword_color },
      ["@conditional.c"] = { fg = keyword_color },
      ["@repeat.c"] = { fg = keyword_color },
      ["@statement.c"] = { fg = keyword_color },
    }
    for group, setting in pairs(ts_groups) do
      groups[group] = setting
    end
  end

  -- Also override the base Property group to prevent linking
  groups["Property"] = { fg = colors.property }

  return groups
end

return M
