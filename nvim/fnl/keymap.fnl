(local {: map} (require :utils))
(local todo (require :todo-comments))
(local {: register} (require :which-key))
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

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

(fn map-jump [leader]
  (register {:j {:name :+Jump
                 := [todo.jump_next "Todo next"]
                 :- [todo.jump_prev "Todo prev"]
                 "]" [vim.diagnostic.goto_next "Diagnostic Next"]
                 "[" [vim.diagnostic.goto_prev "Diagnostic Prev"]}}
            {:prefix leader}))

(fn map-toggle [leader]
  (register {:t {:name :+Toggle
                 :t [":ToggleTerm<CR>" :Terminal]
                 :n [":NvimTreeToggle<CR>" :Nerdtree]}}
            {:prefix leader}))

(fn map-find [leader]
  (register {:f {:name :+Find
                 :t [":TodoTelescope<CR>" :Todos]
                 :f [":Telescope find_files<CR>" :Files]
                 :g [":Telescope live_grep<CR>" "Live grep"]
                 :b [":Telescope buffers<CR>" :Buffers]
                 :m [":Telescope man_pages<CR>" :Man]
                 :c [":Telescope colorscheme<CR>" :Colorscheme]
                 :k [":Telescope keymaps<CR>" :Keymaps]}}
            {:prefix leader}))

(fn map-buffer [leader]
  (register {:b {:name :+Buffer
                 :c [":BufferClose<CR>" "Close current"]
                 :w [":BufferCloseAllButCurrentOrPinned<CR>" "Close all but"]
                 :p [":BufferPrevious<CR>" "Goto prev"]
                 :n [":BufferNext<CR>" "Goto next"]
                 :1 [":BufferGoto 1<CR>" "Goto 1st"]
                 :2 [":BufferGoto 2<CR>" "Goto 2nd"]
                 :3 [":BufferGoto 3<CR>" "Goto 3rd"]
                 :P [":BufferPin<CR>" :Pin]
                 :b [":BufferPick<CR>" :Pick]
                 :o {:name :+Order
                     :n [":BufferOrderByBufferNumber<CR>" "By number"]
                     :d [":BufferOrderByDirectory<CR>" "By directory"]}}}
            {:prefix leader}))

(fn map-defaults []
  (map-toggle " ")
  (map-buffer " ")
  (map-find " ")
  (map-jump " "))

(map-defaults)

(fn map-for-language [name leader bufnr]
  (when (= name :rescriptls)
    (register {:r {:name :+Rescript
                   :b [":RescriptBuild<CR>" :Build]
                   :c [":RescriptClean<CR>" :Clean]}}
              {:prefix leader :buffer bufnr})))

(fn map-when-lsp [capa leader bufnr]
  (local mappings {leader {}})
  (local opts {:buffer bufnr})
  (local b vim.lsp.buf)
  (when capa.declarationProvider
    (tset mappings leader :D [b.declaration :Declaration]))
  (when capa.definitionProvider
    (tset mappings leader :h [":Lspsaga lsp_finder<CR>" :Finder])
    (tset mappings leader :d [":Lspsaga peek_definition<CR>" :Definition]))
  (when capa.implementationProvider
    (tset mappings leader :i [b.implementation :Implementation]))
  (when capa.referencesProvider
    (tset mappings leader :r [b.references :References]))
  (when capa.typeDefinitionProvider
    (tset mappings leader :t [b.type_definition :Type]))
  (when capa.renameProvider
    (tset mappings leader :n [":Lspsaga rename<CR>" :Rename]))
  (when capa.documentFormattingProvider
    (tset mappings leader :f [b.format :Format]))
  (when capa.codeActionProvider
    (tset mappings leader :c [":Lspsaga code_action<CR>" "Code action"]))
  (when capa.signatureHelpProvider
    (tset mappings leader :k [b.signature_help "Signature help"]))
  (when capa.hoverProvider
    (tset mappings leader :K [":Lspsaga hover_doc<CR>" :Hover]))
  (when capa.documentSymbolProvider
    (tset mappings leader :o [":LSoutlineToggle<CR>" "Toggle outline"]))
  (register mappings opts))

:return

{: map-when-lsp : map-for-language}
