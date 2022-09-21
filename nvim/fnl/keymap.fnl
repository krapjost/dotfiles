(fn syn-stack []
  "get highlighting group"
  (let [syn-exists? (vim.fn.exists :.synstack)]
    (when syn-exists?
      (print (vim.fn.synstack (vim.fn.line ".") (vim.fn.col "."))))))

(local opts {:noremap true :silent true})

(vim.keymap.set :n "<leader>\\" ":syn-stack<CR>" opts)
(vim.keymap.set :n :<C-h> :<C-w>h opts)
(vim.keymap.set :n :<C-j> :<C-w>j opts)
(vim.keymap.set :n :<C-k> :<C-w>k opts)
(vim.keymap.set :n :<C-l> :<C-w>l opts)
(vim.keymap.set :n :<C--> :<C-w>_ opts)
(vim.keymap.set :n "<C-\\>" :<C-w>| opts)
(vim.keymap.set :n "]\\" vim.diagnostic.goto_next opts)
(vim.keymap.set :n "[\\" vim.diagnostic.goto_prev opts)
(vim.keymap.set :n :<C-n> ":NvimTreeToggle<CR>" opts)
(vim.keymap.set :n :<C-S-Tab> ":BufferPrevious<CR>" opts)
(vim.keymap.set :n :<C-Tab> ":BufferNext<CR>" opts)
(vim.keymap.set :n :<A-<> ":BufferMovePrevious<CR>" opts)
(vim.keymap.set :n :<A->> ":BufferMoveNext<CR>" opts)
(vim.keymap.set :n :<A-1> ":BufferGoto 1<CR>" opts)
(vim.keymap.set :n :<A-2> ":BufferGoto 2<CR>" opts)
(vim.keymap.set :n :<A-3> ":BufferGoto 3<CR>" opts)
(vim.keymap.set :n :<A-4> ":BufferGoto 4<CR>" opts)
(vim.keymap.set :n :<A-5> ":BufferGoto 5<CR>" opts)
(vim.keymap.set :n :<A-6> ":BufferGoto 6<CR>" opts)
(vim.keymap.set :n :<A-7> ":BufferGoto 7<CR>" opts)
(vim.keymap.set :n :<A-8> ":BufferGoto 8<CR>" opts)
(vim.keymap.set :n :<A-9> ":BufferLast<CR>" opts)
(vim.keymap.set :n :<A-p> ":BufferPin<CR>" opts)
(vim.keymap.set :n :<A-q> ":BufferClose<CR>" opts)
(vim.keymap.set :n :<leader>p ":BufferPick<CR>" opts)
(vim.keymap.set :n :<leader>bb ":BufferOrderByBufferNumber<CR>" opts)
(vim.keymap.set :n :<leader>bd ":BufferOrderByDirectory<CR>" opts)
(vim.keymap.set :n :<leader>bl ":BufferOrderByWindowNumber<CR>" opts)
(vim.keymap.set :n :<leader>ff ":Telescope find_files<CR>" opts)
(vim.keymap.set :n :<leader>fg ":Telescope live_grep<CR>" opts)
(vim.keymap.set :n :<leader>fb ":Telescope buffers<CR>" opts)
(vim.keymap.set :n :<leader>fh ":Telescope help_tags<CR>" opts)
(vim.keymap.set :v :<leader>rr
                "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>"
                {:noremap true})

(vim.keymap.set :n :<C-f>f ":<C-r><C-w>")
