local cmp = require("cmp")

cmp.setup({
	preselect = "item",
	completion = { completeopt = "menu,menuone,noinsert" },
	source = {
		{ name = "nvim_lsp", priority = 10, group_index = 1, max_item_count = 30 },
		{ name = "luasnip", max_item_count = 10 },
		{ name = "path", max_item_count = 8 },
		{ name = "buffer", keyword_length = 5 },
	},
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
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Esc>"] = cmp.mapping(function(fallback)
			require("luasnip").unlink_current()
			fallback()
		end),
	}),
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, item)
			item.menu = ({
				nvim_lsp = item.kind,
				luasnip = "Snippet",
				buffer = "Text",
				path = "Path",
			})[entry.source.name]
			local icons = require("xme.icons")
			if item.kind == "Color" and entry.completion_item.documentation then
				local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
				if r then
					local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
					local group = "Tw_" .. color
					if vim.fn.hlID(group) < 1 then
						vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
					end
					item.kind = "■" -- or "⬤" or anything
					item.kind_hl_group = group
				end
			elseif icons.kind[item.kind] then
				item.kind = icons.kind[item.kind]
			end
			return item
		end,
	},
	performance = {
		max_view_entries = 80,
	},
})
