-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- NeoTree
-- vim.keymap.set('n', '<leader>no', ':Neotree filesystem reveal left<CR>')
-- vim.keymap.set('n', '<leader>nc', ':Neotree filesystem close<CR>')
-- vim.keymap.set('n', '<leader>nr', ':Neotree reveal<CR>')

-- Quitter le terminal ET revenir au buffer précédent (robuste)
vim.keymap.set('t', '<C-q>', function()
  -- 1) quitter proprement le mode terminal (équiv. à <C-\><C-n>)
  local esc = vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'n', false)

  -- 2) quand on est bien revenu en mode normal, basculer
  vim.schedule(function()
    -- essayer d'aller à l'alternate buffer
    local ok = pcall(vim.cmd, 'b#')
    if not ok then
      -- fallback : revenir à la fenêtre précédente
      pcall(vim.cmd, 'wincmd p')
    end
  end)
end, { noremap = true, silent = true })
