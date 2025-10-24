-- ~/.config/nvim/LuaSnip/all.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- -- Simple text snippet
  -- s({ trig = "hi", dscr = "Expands to 'Hello, world!'" },
  --   { t("Hello, world!") }
  -- ),

  -- -- Another simple snippet
  -- s({ trig = "foo", dscr = "Expands to 'Another snippet.'" },
  --   { t("Another snippet.") }
  -- ),

  -- LaTeX-style snippet: \texttt{}
  s({ trig = "tt", dscr = "Expands 'tt' into '\\texttt{}'" },
    {
      t("\\texttt{"),
      i(1),
      t("}"),
    }
  ),

  -- LaTeX-style snippet: \frac{}{}
  s({ trig = "ff", dscr = "Expands 'ff' into '\\frac{}{}'" },
    {
      t("\\frac{"),
      i(1),
      t("}{"),
      i(2),
      t("}"),
    }
  ),

  -- The same equation snippet, using LuaSnip's fmt function.
  -- The snippet is not shorter, but it is more *human-readable*.
  s({trig="eq", dscr="A LaTeX equation environment"},
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{equation}
          <>
      \end{equation}
    ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),

  -- The same equation snippet, using LuaSnip's fmt function.
  -- The snippet is not shorter, but it is more *human-readable*.
  s({trig="bm", dscr="A LaTeX equation environment"},
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{bmatrix}
          <>
      \end{bmatrix}
    ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),

  -- Code for environment snippet in the above GIF
  s({trig="env", dscr="Any LaTeX environment"},  -- snippetType="autosnippet"
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),  -- this node repeats insert node i(1)
      }
    )
  ),




}

