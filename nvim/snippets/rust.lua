local ls = require('luasnip')
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node

return {
    s(
        {
            trig = 'test'
        },

        fmt(
            [[
                #[test]
                fn {}() {{
                    {}
                }}
            ]],
            {
                i(1, 'name'),
                i(2, '')
            }
        )
    )
}
