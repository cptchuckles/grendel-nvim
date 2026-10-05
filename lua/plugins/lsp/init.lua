local core = require('plugins.lsp.core')
local dotnet = require('plugins.lsp.dotnet')
local java = require('plugins.lsp.java')

local packages = {}
for _, v in ipairs(core[1]) do
    table.insert(packages, v)
end
for _, v in ipairs(dotnet[1]) do
    table.insert(packages, v)
end
for _, v in ipairs(java[1]) do
    table.insert(packages, v)
end

return {
    packages,
    config = function()
        core.config()
        dotnet.config()
        java.config()
    end,
}
