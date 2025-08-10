local function get_colors()
  return {
    blue = "#1f0d88",
    red = "#fc1616",
    purple = "#4e1847",
    green = "#165046",
    orange = "#6e380e",
    magneta = "#551154",
    black = "#000000",
    text = "#fce9ca",

    light_green = "#21a40b",
    light_magenta = "#b59efa",
    light_red = "#ff0000",
    light_blue = "#1BD1DE",
    light_orange = "#660808",
    light_purple = "#9B28DE",
    white = "#ffffff",

    gutter_fg = "#78808f",
    nontext = "#d2d6dc",
  }
end

local palette = get_colors()

return {


  bg         = "#100505",
  fg         = palette.text,
  cursorline = "#ebc2a8",
  section    = "#ebc2a82",
  linenr     = "#3d0c11",
  comment    = palette.green,

  -- Syntax
  keyword    = palette.light_purple,
  Function   = palette.red,
  string     = palette.light_green,
  constant   = palette.light_blue,
  type       = palette.magneta,
  number     = palette.light_magenta,
  boolean    = palette.light_red,
  operator   = palette.orange,
  variable   = palette.text,
  parameter  = palette.text,
  identifier = palette.light_red,
  property   = palette.light_red,


  -- UI
  cursor     = palette.white,
  visual     = palette.gutter_fg,
  search     = palette.light_blue,
  statusline = palette.white,
  menu_bg    = "#100505",
  menu_sel   = "#ebc2a82",
  fold       = "#3e4a5a",
  split      = "#334155",

  -- Diagnostics
  diag_error = "#f38ba8",
  diag_warn  = "#fab387",
  diag_info  = "#89dceb",
  diag_hint  = "#b4befe",

}
