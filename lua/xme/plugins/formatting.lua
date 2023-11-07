return {
	{
		"stevearc/conform.nvim",
		version = false,
		config = function()
			local conform = require("conform")
			local slow_format_filetypes = {}
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { { "prettierd", "prettier" } },
					javascriptreact = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					typescriptreact = { { "prettierd", "prettier" } },
					vue = { { "prettierd", "prettier" } },
					css = { { "prettierd", "prettier" } },
					scss = { { "prettierd", "prettier" } },
					html = { { "prettierd", "prettier" } },
					json = { { "prettierd", "prettier" } },
				},
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					if slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					local function on_format(err)
						if err and err:match("timeout$") then
							slow_format_filetypes[vim.bo[bufnr].filetype] = true
						end
					end
					return { timeout_ms = 200, lsp_fallback = true }, on_format
				end,
				format_after_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					if not slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					return { lsp_fallback = true }
				end,
			})

			vim.api.nvim_create_user_command("ToggleAutoFormat", function(args)
				if args.bang then
					-- Toggle will disable formatting only for this buffer
					vim.b.disable_autoformat = vim.b.disable_autoformat ~= true
				else
					vim.g.disable_autoformat = vim.g.disable_autoformat ~= true
				end
			end, {
				desc = "Toggle auto formatting",
				bang = true,
			})

			vim.keymap.set("n", "<C-s>", vim.cmd.w, {})
			vim.keymap.set("n", "<leader>lf", function()
				require("conform").format({ async = true })
			end)
		end,
	},
}
