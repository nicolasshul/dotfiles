return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "clangd",
          "cmake",
          "ts_ls",
          "html",
          "cssls",
          "sqlls",
          "rust_analyzer",
          "bashls",
          "texlab",
          "lua_ls",
        }
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "pyright",
        "clangd",
        "cmake",
        "ts_ls",
        "html",
        "cssls",
        "sqlls",
        "rust_analyzer",
        "bashls",
        "texlab",
        "lua_ls",
      }

      for _, server in ipairs(servers) do

        local opts = {
          capabilities = capabilities,
        }

        vim.lsp.config(server, {
          capabilities = capabilities,
        })

        if server == "clangd" then
          opts.cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--query-driver=/**/xtensa-*-elf-gcc,/**/riscv32-esp-elf-gcc","/**/ccache",
          }
        end

        vim.lsp.enable(server)
      end

    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),

					["<CR>"] = cmp.mapping.confirm({
						select = false,
					}),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}

