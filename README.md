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
  vim.api.nvim_set_hl(0, '@number', { fg = '#e933e3' })
  vim.cmd("colorscheme materscheme")
end,
```

Default:
```lua
config = function()
  Comment = { fg = colors.comment, italic = true },
  Keyword = { fg = colors.keyword, italic = true },
end,
```
