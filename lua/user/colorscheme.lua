local colors = {
    black = '#000000',
    blue = '#0033B3',
    sky = '#1750EB',
    green = '#067D17',
    purple = '#871094',
    gray = '#8C8C8C',
    gold = '#7A7A43',
    teal = '#248F8F',
    turquoise = '#20999D',
}

local highlightGroups = {
    ["@keyword"] = { fg = colors.blue }
}

require("catppuccin").setup({
    flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = true, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        latte = {
            base = "#ffffff"
        }
    },
    custom_highlights = highlightGroups,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- require("catppuccin.lib.highlighter").syntax(highlightGroups)

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
