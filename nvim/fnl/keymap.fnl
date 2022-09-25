(local {: map} (require :utils))
(local todo (require :todo-comments))

(map :j= todo.jump_next "Next todo" :<leader>)
(map :j- todo.jump_prev "Prev todo" :<leader>)
(map "j]" vim.diagnostic.goto_next "Next diagnostic" :<leader>)
(map "j[" vim.diagnostic.goto_prev "Prev diagnostic" :<leader>)

(map :tt ":ToggleTerm<CR>" :Terminal :<leader>)
(map :tn ":NvimTreeToggle<CR>" :Nerdtree :<leader>)

(map :ft ":TodoTelescope<CR>" :Todos :<leader>)
(map :ff ":Telescope find_files<CR>" :Files :<leader>)
(map :fg ":Telescope live_grep<CR>" "Live grep" :<leader>)
(map :fb ":Telescope buffers<CR>" :Buffers :<leader>)
(map :fm ":Telescope man_pages<CR>" "Man pages" :<leader>)
(map :fc ":Telescope colorscheme<CR>" :Colorscheme :<leader>)
(map :fk ":Telescope keymaps<CR>" :Keymaps :<leader>)

(map :bon ":BufferOrderByBufferNumber<CR>" "By number" :<leader>)
(map :bod ":BufferOrderByDirectory<CR>" "By directory" :<leader>)
(map :bc ":BufferClose<CR>" "Close current" :<leader>)
(map :bw ":BufferCloseAllButCurrentOrPinned<CR>" "Close all but current"
     :<leader>)

(map :bp ":BufferPrevious<CR>" "Prev buffer" :<leader>)
(map :bn ":BufferNext<CR>" "Next buffer" :<leader>)
(map :b1 ":BufferGoto 1<CR>" "1st buffer" :<leader>)
(map :b2 ":BufferGoto 2<CR>" "2nd buffer" :<leader>)
(map :b3 ":BufferGoro 3<CR>" "3rd buffer" :<leader>)
(map :bb ":BufferPick<CR>" "Pick buffer" :<leader>)

(map "?" ":WhichKey<CR>" "Show keymaps" :<leader>)

(map :<C-h> :<C-w>h "Move left")
(map :<C-j> :<C-w>j "Move down")
(map :<C-k> :<C-w>k "Move up")
(map :<C-l> :<C-w>l "Move right")
(map :<esc> "<C-\\><C-n>" "Exit term-mode" nil :t)
(map :<C-h> "<C-\\><C-n>:wincmd h<CR>" "Move left" nil :t)
(map :<C-j> "<C-\\><C-n>:wincmd j<CR>" "Move down" nil :t)
(map :<C-k> "<C-\\><C-n>:wincmd k<CR>" "Move up" nil :t)
(map :<C-l> "<C-\\><C-n>:wincmd l<CR>" "Move right" nil :t)

(map :<C-f>f ":<C-r><C-w>" "yank word under cursor into cmd")

(fn set-lsp-keymaps [bufnr]
  (map :gD vim.lsp.buf.declaration "Goto declaration" nil nil bufnr)
  (map :gd "<cmd>Lspsaga peek_definition<CR>" "Peek definition" nil nil bufnr)
  (map :gi vim.lsp.buf.implementation "Goto implementation" nil nil bufnr)
  (map :gr vim.lsp.buf.references "Goto references" nil nil bufnr)
  (map :fm vim.lsp.buf.format :Format nil nil bufnr)
  (map :K "<cmd>Lspsaga hover_doc<CR>" "Hover doc" nil nil bufnr)
  (map :gh "<cmd>Lspsaga lsp_finder<CR>" :Finder nil nil bufnr)
  (map :<C-k> vim.lsp.buf.signature_help :Help nil nil bufnr)
  (map :to ":LSoutlineToggle<CR>" "Lsp outline" nil nil bufnr)
  (map :D vim.lsp.buf.type_definition "Type definition" nil nil bufnr)
  (map :rn "<cmd>Lspsaga rename<CR>" :Rename nil nil bufnr)
  (map :ca "<cmd>Lspsaga code_action<CR>" "Code action" nil nil bufnr)
  (map :ca "<cmd><C-U>Lspsaga range_code_action<CR>" "Code action" nil :v bufnr)
  (map :wa vim.lsp.buf.add_workspace_folder "Add workspace" nil nil bufnr)
  (map :wr vim.lsp.buf.remove_workspace_folder "Remove workspace" nil nil bufnr))

:return

{: set-lsp-keymaps}
