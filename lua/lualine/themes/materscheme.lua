-- Try to require the palette, with fallback colors if it fails
local ok, colors = pcall(require, "materscheme.palette")
if not ok then
  -- Fallback colors if palette can't be loaded
  colors = {
    bg = "#100505",
    fg = "#fce9ca",
    red = "#fc1616",
    light_green = "#21a40b",
    light_blue = "#1BD1DE",
    light_purple = "#9B28DE",
    orange = "#6e380e",
    light_magenta = "#b59efa",
    menu_sel = "#ebc2a8",
    gutter_fg = "#78808f",
    black = "#000000",
  }
end

local materscheme = {}

-- Define the main theme colors
local theme_colors = {
  bg = colors.bg,                -- "#100505"
  fg = colors.fg,                -- "#fce9ca"
  red = colors.red,              -- "#fc1616"
  green = colors.light_green,    -- "#21a40b"
  blue = colors.light_blue,      -- "#1BD1DE"
  purple = colors.light_purple,  -- "#9B28DE"
  orange = colors.orange,        -- "#6e380e"
  yellow = colors.light_magenta, -- "#b59efa" (using as yellow alternative)

  -- Slightly lighter/darker variants for contrast
  bg_alt = colors.menu_sel,  -- "#ebc2a82" (lighter bg)
  fg_alt = colors.gutter_fg, -- "#78808f" (dimmer text)
  bg_dark = colors.black,    -- "#000000" (darker bg)
}

-- Normal mode
materscheme.normal = {
  a = { bg = theme_colors.red, fg = theme_colors.bg, gui = 'bold' },
  b = { bg = theme_colors.red, fg = theme_colors.fg },
  c = { bg = theme_colors.bg, fg = theme_colors.fg }, -- Changed from fg_alt to fg-- For example, make filenames blue:
}

-- Insert mode
materscheme.insert = {
  a = { bg = theme_colors.green, fg = theme_colors.bg, gui = 'bold' },
  b = { bg = theme_colors.bg_alt, fg = theme_colors.fg },
  c = { bg = theme_colors.bg, fg = theme_colors.fg }, -- Changed from fg_alt to fg
}

-- Visual mode
materscheme.visual = {
  a = { bg = theme_colors.purple, fg = theme_colors.bg, gui = 'bold' },
  b = { bg = theme_colors.bg_alt, fg = theme_colors.fg },
  c = { bg = theme_colors.bg, fg = theme_colors.fg }, -- Changed from fg_alt to fg
}

-- Replace mode
materscheme.replace = {
  a = { bg = theme_colors.red, fg = theme_colors.bg, gui = 'bold' },
  b = { bg = theme_colors.bg_alt, fg = theme_colors.fg },
  c = { bg = theme_colors.bg, fg = theme_colors.fg }, -- Changed from fg_alt to fg
}

-- Command mode
materscheme.command = {
  a = { bg = theme_colors.orange, fg = theme_colors.bg, gui = 'bold' },
  b = { bg = theme_colors.bg_alt, fg = theme_colors.fg },
  c = { bg = theme_colors.bg, fg = theme_colors.fg }, -- Changed from fg_alt to fg
}

-- Terminal mode
materscheme.terminal = {
  a = { bg = theme_colors.yellow, fg = theme_colors.bg, gui = 'bold' },
  b = { bg = theme_colors.bg_alt, fg = theme_colors.fg },
  c = { bg = theme_colors.bg, fg = theme_colors.fg }, -- Changed from fg_alt to fg
}

-- Inactive windows
materscheme.inactive = {
  a = { bg = theme_colors.bg_dark, fg = theme_colors.fg_alt, gui = 'bold' },
  b = { bg = theme_colors.bg_dark, fg = theme_colors.fg_alt },
  c = { bg = theme_colors.bg_dark, fg = theme_colors.fg_alt },
}



return materscheme
