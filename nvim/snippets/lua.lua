local ls = require('luasnip')
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node

return {
    s(
        { trig = 'initM', dscr = 'Create module with setup function' },
        fmt(
            [[
                    local setup = function()
                        {}
                    end

                    local M = {{
                        setup = setup,
                    }}

                    return M
                ]],
            {
                i(1)
            }
        )

    )
}
