-- VSCode-style Cmd+key mappings
-- Ghostty remaps Cmd to Ctrl/Ctrl+Shift (CSI u), tmux forwards them, neovim maps them.
-- Physical keys are still Cmd+P etc in Ghostty — they just arrive as Ctrl equivalents.

return {
  'folke/which-key.nvim', -- attach to existing which-key (already loaded by kickstart)
  optional = true,
  init = function()
    local builtin = function(name)
      return function() require('telescope.builtin')[name]() end
    end

    -- Cmd+P → Ctrl+P → find files
    vim.keymap.set('n', '<C-p>', builtin 'find_files', { desc = 'Find files (Cmd+P)' })

    -- Cmd+Shift+F → Ctrl+Shift+F → live grep
    vim.keymap.set('n', '<C-S-f>', builtin 'live_grep', { desc = 'Live grep (Cmd+Shift+F)' })

    -- Cmd+B → Ctrl+Shift+B → toggle sidebar explorer
    vim.keymap.set('n', '<C-S-b>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle explorer (Cmd+B)' })

    -- Cmd+S → Ctrl+S → save
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save (Cmd+S)' })

    -- GitHub permalink — copies to clipboard
    vim.keymap.set('n', '<leader>gl', function()
      local file = vim.fn.expand '%:.'
      local line = vim.fn.line '.'
      vim.fn.system('gh browse --no-browser ' .. file .. ':' .. line)
      vim.notify('Copied GitHub permalink', vim.log.levels.INFO)
    end, { desc = '[G]itHub [L]ink' })

    -- Cmd+/ → Ctrl+/ → toggle comment
    vim.keymap.set('n', '<C-/>', 'gcc', { remap = true, desc = 'Toggle comment (Cmd+/)' })
    vim.keymap.set('v', '<C-/>', 'gc', { remap = true, desc = 'Toggle comment (Cmd+/)' })
  end,
}
