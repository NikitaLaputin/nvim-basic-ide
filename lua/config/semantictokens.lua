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
  local highlight_ns = vim.api.nvim_create_namespace("lsp_semantic_ns")

  set_hl(highlight_ns, "LspParameter", { fg = colors.blue })
  set_hl(highlight_ns, "LspType", { fg = colors.green })
  set_hl(highlight_ns, "LspClass", { fg = colors.teal })
  set_hl(highlight_ns, "LspComment", { fg = colors.grey, italic = true })
  set_hl(highlight_ns, "LspDecorator", { fg = colors.black })
  set_hl(highlight_ns, "LspEnum", { fg = colors.teal })
  set_hl(highlight_ns, "LspEnumMember", { fg = colors.light_blue, italic = true })
  -- set_hl(highlight_ns, "LspEvent", { fg = "TSProperty" })
  set_hl(highlight_ns, "LspFunction", { fg = colors.black, italic = true })
  set_hl(highlight_ns, "LspInterface", { fg = colors.green })
  set_hl(highlight_ns, "LspKeyword", { fg = colors.dark_red, italic = true })
  -- set_hl(highlight_ns, "LspMacro", { fg = "TSFuncMacro" })
  set_hl(highlight_ns, "LspMethod", { fg = colors.purple })
  -- set_hl(highlight_ns, "LspModifier", { fg = "TSTypeQualifier" })
  set_hl(highlight_ns, "LspNamespace", { fg = colors.purple })
  set_hl(highlight_ns, "LspNumber", { fg = colors.light_blue })
  set_hl(highlight_ns, "LspOperator", { fg = colors.black, italic = true })
  set_hl(highlight_ns, "LspProperty", { fg = colors.light_blue })
  -- set_hl(highlight_ns, "LspRegexp", { fg = "TSStringRegex" })
  set_hl(highlight_ns, "LspString", { fg = colors.blue })
  -- set_hl(highlight_ns, "LspStruct", { fg = "TSTypeDefinition" })
  set_hl(highlight_ns, "LspTypeParameter", { fg = colors.teal })
  set_hl(highlight_ns, "LspVariable", { fg = colors.light_blue })

  -- modifier
  -- set_hl(highlight_ns, "LspDeclaration", { link = "TSDefine" })
  -- set_hl(highlight_ns, "LspDefinition", { link = "TSTypeDefinition" })
  -- set_hl(highlight_ns, "LspReadonly", { link = "TSContant" })
  -- set_hl(highlight_ns, "LspStatic", { link = "TSConsantMacro" })
  -- set_hl(highlight_ns, "LspDeprecated", { link = "TSWarning" })
  -- set_hl(highlight_ns, "LspAbstract", { fg = "#9E6162" })
  -- set_hl(highlight_ns, "LspAsync", { fg = "#81A35C" })
  -- set_hl(highlight_ns, "LspModification", { fg = "#7E5CA3" })
  -- set_hl(highlight_ns, "LspDocumentation", { fg = "#ccc0f5" })
  -- set_hl(highlight_ns, "LspDefaultLibrary", { fg = "#c99dc1" })

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
