local signs = {
	{ name = "DiagnosticSignError", severity = vim.diagnostic.severity.ERROR, text = "󰅙" },
	{ name = "DiagnosticSignWarn",  severity = vim.diagnostic.severity.WARN, text = "" },
	{ name = "DiagnosticSignInfo",  severity = vim.diagnostic.severity.INFO, text = "" },
	{ name = "DiagnosticSignHint",  severity = vim.diagnostic.severity.HINT, text = "󰌶" },
}
local signs_text = {}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, {
		texthl = sign.name,
		text   = sign.text,
		numhl  = "",
	})
    signs_text[sign.severity] = sign.text
end

vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
		spacing  = 2,
		prefix   = "⋮",
	},
	signs = {
        text = signs_text,
    },
	update_in_insert = true,
	severity_sort    = true,
	underline = {
		severity = {
			min = vim.diagnostic.severity.INFO,
		},
	},
	float = {
		focusable = false,
		style     = "minimal",
		border    = "rounded",
		source    = "if_many",
		header    = "",
		prefix    = "· ",
	},
})
