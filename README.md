# materscheme.nvim

## Showcase:
<img width="1871" height="977" alt="image" src="https://github.com/user-attachments/assets/bb91fc04-8cbb-467d-80f7-1c7470e86153" />



## Features:
- A colorscheme
- More to come in the future

## Installation:
Download with your favourite package manager

```Lua { 'Matercan/materscheme.nvim' } -- Lazy ```

```Lua use 'Matercan/materscheme.nvim' -- Packer ```

## Usage:
Simply use the built-in command ``:colorscheme``

```Vim colorscheme matervim ```

```Lua vim.cmd("colorscheme materscheme") ```

## Configuration
There is no need to call ``setup()`` if you are fine with the default configuration.
If you would like to change any of the options, you need to edit it in the ``config = function()`` using ``vim.api`` directly

```lua
-- Example
config = function()
  require(materscheme).setup({
    Normal = { bg = colors.light_blue, fg = colors.fg },
    NormalFloat = { bg = colors.blue, fg = colors.fg },
  })

  vim.cmd("colorscheme materscheme")
end,
```

Default:
```lua
config = function()
  require(materscheme).setup({
      -- standard
    comment = { fg = colors.comment, italic = true },
    keyword = { fg = colors.keyword, italic = true },
    identifier = { fg = colors.identifier },
    property = { fg = colors.property },
    variable = { fg = colors.variable },
    normal = { bg = colors.bg, fg = colors.fg },
    normalfloat = { bg = colors.bg, fg = colors.fg },

    --treesitter
    ["@string"] = { fg = colors.string },
    ["@variable"] = { fg = colors.variable },
    ["@parameter"] = { fg = colors.parameter },
  })

  vim.cmd("colorscheme materscheme")
end,
```

Options for colors:

blue = "#1f0d88"
red = "#fc1616"
purple = "#4e1847"
green = "#165046"
orange = "#6e380e"
magneta = "#551154"
black = "#000000"
text = "#fce9ca"

light_green = "#21a40b"
light_magenta = "#b59efa"
light_red = "#ffffff"
light_blue = "#1BD1DE"
light_orange = "#660808"
light_purple = "#9B28DE"
white = "#ffffff"

gutter_fg = "#78808f"
nontext = "#d2d6dc"
