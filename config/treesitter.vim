" treesitter for onrdark.nvim
lua <<EOF
require'spellsitter'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true, },
  incremental_selection = {
    enable = true,
    keymaps = {
      --- init_selection = "gnn",
      node_incremental = "g]",
      --- scope_incremental = "grc",
      node_decremental = "g[",
    },
  },
  --- nvim-treesitter-refactor
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = "grr", },
    },
  },
  --- nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next =     { ["<leader>a"] = "@parameter.inner", },
      swap_previous = { ["<leader>A"] = "@parameter.inner", },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { ["]m"] = "@function.outer", },
      goto_next_end =   { ["]M"] = "@function.outer", },
      goto_previous_start = { ["[m"] = "@function.outer", },
      goto_previous_end =   { ["[M"] = "@function.outer", },
    },
  },
}
EOF


