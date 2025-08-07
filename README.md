# materscheme.nvim

## Showcase:
<img width="1870" height="973" alt="image" src="https://github.com/user-attachments/assets/2dbf450b-65d4-41e8-b2d0-10806d0d97d7" />

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
