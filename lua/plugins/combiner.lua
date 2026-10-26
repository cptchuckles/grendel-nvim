local M = {
    {},
}

function M:combine(pkg)
    for _, v in ipairs(pkg[1]) do
        table.insert(self[1], v)
    end
    if pkg.config then
        local existing_config = self.config
        if existing_config then
            self.config = function()
                existing_config()
                pkg.config()
            end
        else
            self.config = pkg.config
        end
    end
    return self
end

return M
