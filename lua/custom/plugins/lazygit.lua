-- Lazygit integration — full git UI in a floating terminal
return {
  'kdheepak/lazygit.nvim',
  cmd = 'LazyGit',
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it' },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
}
