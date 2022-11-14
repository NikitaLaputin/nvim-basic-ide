require("onedark").setup({
  style = "light",
  toggle_style_key = "<leader>ts",
  transparent = true,
  colors = {
    bg0 = nil,
    bg_d = nil,
  }
})

local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- overrides
local colors = {
    purple = '#795DA3',
    blue = '#0086B3',
    teal = '#138E8D',
    light_blue = '#20999D',
    dark_red = '#912841',
    deep_blue = '#183691',
    black = '#333333',
    green = '#597A2B',
    swamp_green = '#5F8C59',
    ocean = '#007B81',
}
local set_color = vim.api.nvim_set_hl
set_color(0, '@type', { fg = colors.green })
set_color(0, '@type.builtin', { fg = colors.dark_red, italic = true })
set_color(0, '@keyword', { fg = colors.dark_red, italic = true })
set_color(0, '@keyword.function', { fg = colors.dark_red, italic = true })
set_color(0, '@keyword.return', { fg = colors.dark_red, italic = true })
set_color(0, '@property', { fg = colors.blue })
set_color(0, '@tag', { fg = colors.swamp_green })
set_color(0, '@tag.attribute', { fg = colors.purple })
set_color(0, '@variable', { fg = colors.ocean })
set_color(0, '@constructor', { fg = colors.purple })
set_color(0, '@string', { fg = colors.deep_blue })
set_color(0, '@include', { fg = colors.dark_red, italic = true })
set_color(0, '@parameter', { fg = colors.blue })
set_color(0, '@constant', { fg = colors.ocean })
set_color(0, '@number', { fg = colors.ocean })
set_color(0, '@variable.builtin', { fg = colors.blue, italic = true })
set_color(0, '@constant.builtin', { fg = colors.dark_red, italic = true })
set_color(0, '@keyword.operator', { fg = colors.dark_red, italic = true })
set_color(0, '@exception', { fg = colors.dark_red, italic = true })
set_color(0, '@boolean', { fg = colors.dark_red, italic = true })
set_color(0, '@method', { fg = colors.dark_red, italic = true })
set_color(0, '@method.call', { fg = colors.purple })
set_color(0, '@punctuation.bracket', { fg = colors.black })
set_color(0, '@operator', { fg = colors.black })
set_color(0, '@conditional', { fg = colors.dark_red, italic = true  })
set_color(0, '@function', { fg = colors.black, italic = true })
set_color(0, '@function.call', { fg = colors.black, italic = true })
set_color(0, '@generic', { fg = colors.light_blue })
set_color(0, '@decorator', { fg = colors.black })
set_color(0, '@method', { fg = colors.purple })
set_color(0, '@class', { fg = colors.teal })
set_color(0, '@jsx.tag', { fg = colors.green })
