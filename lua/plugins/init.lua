local gh = function(path) return 'https://github.com/' .. path end

local setup = function(package)
    for _, pkg in ipairs(package[1]) do
        if type(pkg) == "string" then
            vim.pack.add({gh(pkg)})
        else
            pkg.src = gh(pkg.src)
            vim.pack.add({pkg})
        end
    end
    if package.config ~= nil then package.config() end
end

setup(require('plugins.core'))
setup(require('plugins.telescope'))
setup(require('plugins.trouble'))
setup(require('plugins.tree-sitter'))
setup(require('plugins.completion'))
setup(require('plugins.lsp'))
setup(require('plugins.themes'))
