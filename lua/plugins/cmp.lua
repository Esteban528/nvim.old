return {
  {
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        formatting = {
          format = function(entry, vim_item)
            local KIND_ICONS = {
              Tailwind = '󰹞󰹞󰹞󰹞',
              Color = ' ',
              -- Class = 7,
              -- Constant = '󰚞',
              -- Constructor = 4,
              -- Enum = 13,
              -- EnumMember = 20,
              -- Event = 23,
              -- Field = 5,
              -- File = 17,
              -- Folder = 19,
              -- Function = 3,
              -- Interface = 8,
              -- Keyword = 14,
              -- Method = 2,
              -- Module = 9,
              -- Operator = 24,
              -- Property = 10,
              -- Reference = 18,
              Snippet = "󰅴 ",
              -- Struct = 22,
              -- Text = "",
              -- TypeParameter = 25,
              -- Unit = 11,
              -- Value = 12,
              -- Variable = 6
            }
            if vim_item.kind == 'Color' and entry.completion_item.documentation then
              local _, _, r, g, b =
              ---@diagnostic disable-next-line: param-type-mismatch
                  string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

              if r and g and b then
                local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
                local group = 'Tw_' .. color

                if vim.api.nvim_call_function('hlID', { group }) < 1 then
                  vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
                end

                vim_item.kind = KIND_ICONS.Tailwind
                vim_item.kind_hl_group = group

                return vim_item
              end
            end

            vim_item.kind = KIND_ICONS[vim_item.kind] or vim_item.kind

            return vim_item
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", trigger_characters = {',', '(', '.'}},
          { name = "path" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" },
        }),

      })
    end,
  },
}

--[[return {
  {
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = {
            border = "rounded",
          },
          documentation = {
            border = "rounded",
          },
        },
        formatting = {
          format = function(entry, vim_item)
            local KIND_ICONS = {
              Tailwind = '󰹞󰹞󰹞󰹞',
              Color = ' ',
              -- Class = 7,
              -- Constant = '󰚞',
              -- Constructor = 4,
              -- Enum = 13,
              -- EnumMember = 20,
              -- Event = 23,
              -- Field = 5,
              -- File = 17,
              -- Folder = 19,
              -- Function = 3,
              -- Interface = 8,
              -- Keyword = 14,
              -- Method = 2,
              -- Module = 9,
              -- Operator = 24,
              -- Property = 10,
              -- Reference = 18,
              Snippet = "󰅴 ",
              -- Struct = 22,
              -- Text = "",
              -- TypeParameter = 25,
              -- Unit = 11,
              -- Value = 12,
              -- Variable = 6
            }
            if vim_item.kind == 'Color' and entry.completion_item.documentation then
              local _, _, r, g, b =
              ---@diagnostic disable-next-line: param-type-mismatch
                  string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

              if r and g and b then
                local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
                local group = 'Tw_' .. color

                if vim.api.nvim_call_function('hlID', { group }) < 1 then
                  vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
                end

                vim_item.kind = KIND_ICONS.Tailwind
                vim_item.kind_hl_group = group

                return vim_item
              end
            end

            vim_item.kind = KIND_ICONS[vim_item.kind] or vim_item.kind

            return vim_item
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),

      })
    end,
  },
}]]
    --
