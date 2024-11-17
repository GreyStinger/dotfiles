return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",

    "onsails/lspkind.nvim",
    -- LuaSnip
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip"
  },
  opts = function()
    local cmp = require('cmp')
    local defaults = require("cmp.config.default")()
    local lspkind = require('lspkind')

    return {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'orgmode' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 80,
          ellipsis_char = '...',
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        })
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting
    }
  end,
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    local parse = require("cmp.utils.snippet").parse
      require("cmp.utils.snippet").parse = function(input)
      local ok, ret = pcall(parse, input)
      if ok then
        return ret
      end
    end

    local cmp = require("cmp")
    cmp.setup(opts)
  end
}

