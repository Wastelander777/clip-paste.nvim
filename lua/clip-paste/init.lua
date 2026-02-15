-- lua/clip-paste/init.lua
local M = {}

function M.setup()
	if vim.fn.executable("clip.exe") ~= 1 and vim.fn.executable("powershell.exe") ~= 1 then
		return
	end

	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

return M
