local status_ok, semantictokens = pcall(require, "nvim-semantic-tokens")
if not status_ok then
  return
end

local M = {}

local set_hl = vim.api.nvim_set_hl

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
    grey = '#969896'
}

function M.setup()
  -- token
  -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/highlight.lua
  set_hl(0, "LspParameter", { fg = colors.blue })
  set_hl(0, "LspType", { fg = colors.green })
  set_hl(0, "LspClass", { fg = colors.teal })
  set_hl(0, "LspComment", { fg = colors.grey, italic = true })
  set_hl(0, "LspDecorator", { fg = colors.black })
  set_hl(0, "LspEnum", { fg = colors.teal })
  set_hl(0, "LspEnumMember", { fg = colors.light_blue, italic = true })
  -- set_hl(0, "LspEvent", { fg = "TSProperty" })
  set_hl(0, "LspFunction", { fg = colors.black, italic = true })
  set_hl(0, "LspInterface", { fg = colors.green })
  set_hl(0, "LspKeyword", { fg = colors.dark_red, italic = true })
  -- set_hl(0, "LspMacro", { fg = "TSFuncMacro" })
  set_hl(0, "LspMethod", { fg = colors.purple })
  -- set_hl(0, "LspModifier", { fg = "TSTypeQualifier" })
  set_hl(0, "LspNamespace", { fg = colors.purple })
  set_hl(0, "LspNumber", { fg = colors.light_blue })
  set_hl(0, "LspOperator", { fg = colors.black, italic = true })
  set_hl(0, "LspProperty", { fg = colors.light_blue })
  -- set_hl(0, "LspRegexp", { fg = "TSStringRegex" })
  set_hl(0, "LspString", { fg = colors.blue })
  -- set_hl(0, "LspStruct", { fg = "TSTypeDefinition" })
  set_hl(0, "LspTypeParameter", { fg = colors.teal })
  set_hl(0, "LspVariable", { fg = colors.light_blue })

  -- modifier
  -- set_hl(0, "LspDeclaration", { link = "TSDefine" })
  -- set_hl(0, "LspDefinition", { link = "TSTypeDefinition" })
  -- set_hl(0, "LspReadonly", { link = "TSContant" })
  -- set_hl(0, "LspStatic", { link = "TSConsantMacro" })
  -- set_hl(0, "LspDeprecated", { link = "TSWarning" })
  -- set_hl(0, "LspAbstract", { fg = "#9E6162" })
  -- set_hl(0, "LspAsync", { fg = "#81A35C" })
  -- set_hl(0, "LspModification", { fg = "#7E5CA3" })
  -- set_hl(0, "LspDocumentation", { fg = "#ccc0f5" })
  -- set_hl(0, "LspDefaultLibrary", { fg = "#c99dc1" })

  require("nvim-semantic-tokens").setup {
    preset = "default",
    -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or
    -- function with the signature: highlight_token(ctx, token, highlight) where
    --        ctx (as defined in :h lsp-handler)
    --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
    --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
    highlighters = { require "nvim-semantic-tokens.table-highlighter" },
  }
end

return M
