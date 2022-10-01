(local {: map} (require :utils))
(local {: register} (require :which-key))
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(map "?" ":WhichKey<CR>" "Show keymaps" :<leader>)
(map :<C-h> :<C-w>h "Move left")
(map :<C-j> :<C-w>j "Move down")
(map :<C-k> :<C-w>k "Move up")
(map :<C-l> :<C-w>l "Move right")
(map :<esc> "<C-\\><C-n>:Ttoggle<CR>" "Exit term-mode" nil :t)
(map :<C-h> "<C-\\><C-n>:wincmd h<CR>" "Move left" nil :t)
(map :<C-j> "<C-\\><C-n>:wincmd j<CR>" "Move down" nil :t)
(map :<C-k> "<C-\\><C-n>:wincmd k<CR>" "Move up" nil :t)
(map :<C-l> "<C-\\><C-n>:wincmd l<CR>" "Move right" nil :t)
(map :<C-y> ":<C-r><C-w>" "yank word under cursor into cmd")
(map :<C-c> ":Tclear<CR>" "Clear Term")
(map :<C-s> ":TREPLSendLine<CR>" "Line REPL")
(map :<C-f> ":TREPLSendFile<CR>" "File REPL")
(map ":<CR>" ":noh<CR>" "No highlight")

(fn map-jump [leader]
  ;; TODO: add gitsigns jump here
  (let [todo (require :todo-comments)]
    (if (= leader "[")
        (register {:o [todo.jump_prev "Todo prev"]
                   "\\" [vim.diagnostic.goto_prev "Diagnostic Prev"]}
                  {:prefix leader})
        (register {:o [todo.jump_next "Todo next"]
                   "\\" [vim.diagnostic.goto_next "Diagnostic Next"]}
                  {:prefix leader}))))

(fn cmd-o-num [cmd]
  (tonumber (vim.api.nvim_exec (.. "echo " cmd) true)))

(fn toggle-term [mode size]
  (vim.cmd (.. mode " Ttoggle resize=" size)))

(fn toggle-on-winwidth []
  (if (> (cmd-o-num "winwidth('.')") 100)
      (toggle-term "botright vertical" 50)
      (toggle-term :botright 10)))

(fn map-toggle [leader]
  (register {:t [toggle-on-winwidth :Terminal]
             :n [":NvimTreeToggle<CR>" :Nerdtree]} {:prefix leader}))

(fn map-find [leader]
  (local project-cmd
         ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>")
  (register {:p [project-cmd :Project]
             :o [":TodoTelescope<CR>" :Todos]
             :f [":Telescope find_files<CR>" :Files]
             :g [":Telescope live_grep<CR>" "Live grep"]
             :b [":Telescope buffers<CR>" :Buffers]
             :m [":Telescope man_pages<CR>" :Man]
             :c [":Telescope colorscheme<CR>" :Colorscheme]
             :k [":Telescope keymaps<CR>" :Keymaps]}
            {:prefix leader}))

(fn map-buffer [leader]
  (register {leader {:name :+Buffer
                     :c [":BufferClose<CR>" "Close current"]
                     leader [":BufferCloseAllButCurrentOrPinned<CR>"
                             "Close all but"]
                     :k [":BufferPrevious<CR>" "Goto prev"]
                     :j [":BufferNext<CR>" "Goto next"]
                     :1 [":BufferGoto 1<CR>" "Goto 1st"]
                     :2 [":BufferGoto 2<CR>" "Goto 2nd"]
                     :3 [":BufferGoto 3<CR>" "Goto 3rd"]
                     :p [":BufferPin<CR>" :Pin]}
             :p [":BufferPick<CR>" "Pick buffer"]
             :o {:name :+Order
                 :n [":BufferOrderByBufferNumber<CR>" "By number"]
                 :d [":BufferOrderByDirectory<CR>" "By directory"]}}
            {:prefix leader}))

(fn map-repl [leader]
  (register {:S [":TREPLSendSelection<CR>" "Send selection"]} {:mode :v}))

(fn map-neogit [leader]
  (register {leader [":Neogit<CR>" "Open Neogit"]} {:prefix leader}))

(fn map-defaults []
  (map-toggle :t)
  (map-find :f)
  (map-repl " ")
  (map-jump "]")
  (map-jump "[")
  (map-buffer " ")
  (map-neogit "\\"))

(map-defaults)

(fn map-for-language [name leader bufnr]
  (when (= name :rescriptls)
    (register {:r {:name :+Rescript
                   :b [":RescriptBuild<CR>" :Build]
                   :c [":RescriptClean<CR>" :Clean]}}
              {:prefix leader :buffer bufnr})))

;; TODO: map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
(fn map-for-git [leader bufnr]
  (local gs (require :gitsigns))
  (register {:h {:name :GitSigns
                 :h [":Gitsigns stage_hunk<CR>" :Stage-hunk]
                 :r [":Gitsigns reset_hunk<CR>" :Reset-hunk]}}
            {:prefix leader :buffer bufnr :mode :v})
  (register {:h {:name :+GitSigns
                 :h [":Gitsigns select_hunk<CR>" :Select-hunk]
                 :S [gs.stage_buffer :Stage-buffer]
                 :u [gs.undo_stage_hunk :Undo]
                 :R [gs.reset_buffer :Reset]
                 :p [gs.preview_hunk :Preview]
                 :B [#(gs.blame_line {:full true}) :Blame]
                 :b [gs.toggle_current_line_blame :Toggle-blame]
                 :d [gs.diffthis :Diffthis]
                 :D [#(gs.diffthis "~") :Diffthis-what]
                 :t [gs.toggle_deleted :Toggle-deleted]}}
            {:prefix leader :buffer bufnr}))

(fn map-when-lsp [capa leader bufnr]
  (local mappings {leader {}})
  (local opts {:buffer bufnr})
  (local b vim.lsp.buf)
  (when capa.declarationProvider
    (tset mappings leader :D [b.declaration :Declaration]))
  (when capa.definitionProvider
    (tset mappings leader :d [b.definition :Definition]))
  (when capa.implementationProvider
    (tset mappings leader :i [b.implementation :Implementation]))
  (when capa.referencesProvider
    (tset mappings leader :r [b.references :References]))
  (when capa.typeDefinitionProvider
    (tset mappings leader :t [b.type_definition :Type]))
  (when capa.renameProvider
    (tset mappings leader :n [b.rename :Rename]))
  (when capa.documentFormattingProvider
    (tset mappings leader :f [b.format :Format]))
  (when capa.codeActionProvider
    (tset mappings leader :a [b.code_action "Code action"]))
  (when capa.signatureHelpProvider
    (tset mappings leader :k [b.signature_help "Signature help"]))
  (when capa.hoverProvider
    (tset mappings leader ";" [b.hover :Hover]))
  (when capa.documentSymbolProvider
    (tset mappings leader :o [b.document_symbol "Doc symbols"]))
  (register mappings opts))

:return

{: map-when-lsp : map-for-language : map-for-git}
