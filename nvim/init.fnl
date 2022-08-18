(local opt vim.opt)
(local g vim.g)
(local set-key vim.keymap.set)
(set g.mapleader " ")
(set opt.laststatus 3)
(set opt.autoread true)
(set opt.termguicolors true)
(set opt.ignorecase true)
(set opt.cursorline true)
(set opt.smartcase true)
(set opt.number true)
(set opt.numberwidth 2)
(set opt.relativenumber true)
(set opt.shiftwidth 2)
(set opt.tabstop 2)
(set opt.timeoutlen 0)
(set opt.cmdheight 1)
(set opt.smartindent true)
(set opt.expandtab true)
(set opt.linebreak true)
(set opt.clipboard :unnamedplus)
(set opt.list true)
(set opt.mouse :a)
(set opt.updatetime 100)
(set opt.autoread true)
(var conjure-fennel (. g "conjure#filetype#fennel"))
(set conjure-fennel :conjure.client.fennel.stdio)

(set g.coq_settings
     {:auto_start :shut-up :keymap {:jump_to_mark :<C-CR> :pre_select true}})

(fn preq [name]
  (let [(ok? pkg) (pcall require name)]
    (if ok?
        pkg
        (vim.cmd :PaqSync))))

(fn setup [settings ...]
  (each [_ v (ipairs [...])]
    (let [(ok? pack) (pcall require v)]
      (if ok?
          (pack.setup (. settings v))
          (vim.cmd :PaqSync)))))

;; lsp lines
(vim.diagnostic.config {:signs false
                        :virtual_text false
                        :virtual_lines {:only_current_line true}})

(fn fnlfmt []
  "The fennel formatter"
  (local file (vim.api.nvim_buf_get_name 0))
  (.. ":!fnlfmt --fix " file :<CR> ":e!<CR><CR>"))

(fn syn-stack []
  "get highlighting group"
  ;;   echo set-key(
  ;; synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'
  (let [syn-exists? (vim.fn.exists :.synstack)]
    (when syn-exists?
      (print (vim.fn.synstack (vim.fn.line ".") (vim.fn.col "."))))))

(local opts {:noremap true :silent true})
(set-key :n "<leader>\\" ":syn-stack<CR>" opts)
(set-key :n :<C-h> :<C-w>h opts)
(set-key :n :<C-j> :<C-w>j opts)
(set-key :n :<C-k> :<C-w>k opts)
(set-key :n :<C-l> :<C-w>l opts)
(set-key :n :<C--> :<C-w>_ opts)
(set-key :n "<C-\\>" :<C-w>| opts)
(set-key :n "]\\" vim.diagnostic.goto_next opts)
(set-key :n "[\\" vim.diagnostic.goto_prev opts)
(set-key :n :<C-n> ":NvimTreeToggle<CR>" opts)
(set-key :n :<C-S-Tab> ":BufferPrevious<CR>" opts)
(set-key :n :<C-Tab> ":BufferNext<CR>" opts)
(set-key :n :<A-<> ":BufferMovePrevious<CR>" opts)
(set-key :n :<A->> ":BufferMoveNext<CR>" opts)
(set-key :n :<A-1> ":BufferGoto 1<CR>" opts)
(set-key :n :<A-2> ":BufferGoto 2<CR>" opts)
(set-key :n :<A-3> ":BufferGoto 3<CR>" opts)
(set-key :n :<A-4> ":BufferGoto 4<CR>" opts)
(set-key :n :<A-5> ":BufferGoto 5<CR>" opts)
(set-key :n :<A-6> ":BufferGoto 6<CR>" opts)
(set-key :n :<A-7> ":BufferGoto 7<CR>" opts)
(set-key :n :<A-8> ":BufferGoto 8<CR>" opts)
(set-key :n :<A-9> ":BufferLast<CR>" opts)
(set-key :n :<A-p> ":BufferPin<CR>" opts)
(set-key :n :<A-q> ":BufferClose<CR>" opts)
(set-key :n :<leader>p ":BufferPick<CR>" opts)
(set-key :n :<leader>bb ":BufferOrderByBufferNumber<CR>" opts)
(set-key :n :<leader>bd ":BufferOrderByDirectory<CR>" opts)
(set-key :n :<leader>bl ":BufferOrderByWindowNumber<CR>" opts)
(set-key :n :<leader>ff ":Telescope find_files<CR>" opts)
(set-key :n :<leader>fg ":Telescope live_grep<CR>" opts)
(set-key :n :<leader>fb ":Telescope buffers<CR>" opts)
(set-key :n :<leader>fh ":Telescope help_tags<CR>" opts)
(set-key :v :<leader>rr
         "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>"
         {:noremap true})

(set-key :n :<C-f>f ":<C-r><C-w>")

(local telescope-layout (preq :telescope.actions.layout))

(local settings {:nvim-tree {:view {:adaptive_size true :width 20}
                             :update_focused_file {:enable true
                                                   :update_root true}
                             :respect_buf_cwd true}
                 :nvim-treesitter.configs {:ensure_installed [:python
                                                              :lua
                                                              :fennel
                                                              :clojure
                                                              :commonlisp
                                                              :markdown
                                                              :dart
                                                              :javascript
                                                              :typescript
                                                              :json
                                                              :norg
                                                              :ocaml]
                                           :autotag {:enable true}
                                           :textobjects {:move {:enable true
                                                                :set_jumps true
                                                                :goto_next_start {"]m" "@function.outer"
                                                                                  "]]" "@class.outer"}
                                                                :goto_next_end {"]M" "@function.outer"
                                                                                "][" "@class.outer"}
                                                                :goto_previous_start {"[m" "@function.outer"
                                                                                      "[[" "@class.outer"}
                                                                :goto_previous_end {"[M" "@function.outer"
                                                                                    "[]" "@class.outer"}}
                                                         :select {:enable true
                                                                  :lookahead true
                                                                  :keymaps {:af "@function.outer"
                                                                            :if "@function.inner"
                                                                            :ac "@class.outer"
                                                                            :ic "@class.inner"
                                                                            :al "@loop.outer"
                                                                            :il "@loop.inner"
                                                                            :ap "@parameter.outer"
                                                                            :ip "@parameter.inner"
                                                                            :am "@comment.outer"}}}
                                           :sync_install false
                                           :auto_install true
                                           :highlight {:enable true}
                                           :rainbow {:enable true
                                                     :extended_mode true}}
                 :nvim-autopairs {:fast_wrap {}}
                 :zen-mode {}
                 :coloizer {:RGB true
                            :RRGGBB true
                            :names true
                            :RRGGBBAA true
                            :rgb_fn true
                            :hsl_fn true
                            :css true
                            :css_fn true
                            :mode :background}
                 :Comment {}
                 :lsp_lines {}
                 :leap {:max_aot_targets nil
                        :highlight_unlabeled false
                        :case_sensitive false
                        :character_classes [" \\t\\r\\n"]}
                 :trouble {}
                 :incline {}
                 :staline {:sections {:left [" "
                                             :mode
                                             " "
                                             :branch
                                             " "
                                             :lsp_name]
                                      :mid [:lsp "¯\\_(ツ)_/¯"]
                                      :right [:line_column]}
                           :defaults {:true_colors true
                                      :branch_symbol " "
                                      :line_column "%l:%c [%L]"}
                           :mode_colors {:n "#cdc5a4"
                                         :i "#97a693"
                                         :ic "#a69fb0"
                                         :c "#90896f"
                                         :v "#b0a386"
                                         :V "#b0a386"}
                           :mode_icons {:n "🤧"
                                        :i "🤢"
                                        :ic "😜"
                                        :c "🤒"
                                        :v "🤮"
                                        :V "🤮"}}
                 :neorg {:load {:core.defaults {}
                                :core.norg.concealer {}
                                :core.norg.qol.toc {}
                                :core.norg.journal {}
                                :core.presenter {:config {:zen_mode :zen-mode}}
                                ;; :core.norg.completion {:config {:engine :nvim-cmp}}
                                :core.gtd.base {:config {:workspace :main}}
                                :core.norg.dirman {:config {:workspaces {:main "~/neorg"}
                                                            :autodetect true
                                                            :autochdir true}}}}
                 :telescope {:defaults {"dynamic_preview_title:" true
                                        :winblend 10
                                        :borderchars [" "
                                                      " "
                                                      " "
                                                      " "
                                                      " "
                                                      " "
                                                      " "
                                                      " "]
                                        :layout_strategy :flex
                                        :layout_config {:horizontal {:prompt_position :top
                                                                     :preview_width 0.55}
                                                        :vertical {:mirror false}
                                                        :width 0.9
                                                        :height 0.8
                                                        :preview_cutoff 120}
                                        :preview {}
                                        :mappings {:n {:<C-p> telescope-layout.toggle_preview}
                                                   :i {:<C-p> telescope-layout.toggle_preview}}}}
                 :refactoring {}
                 :fidget {}})

(local servers [:sumneko_lua
                :ltex
                :dartls
                :jsonls
                :pyright
                :tsserver
                :elixirls
                :rescriptls
                :clojure_lsp
                :rust_analyzer])

(local pkgs [:savq/paq-nvim
             :udayvir-singh/tangerine.nvim
             :neovim/nvim-lspconfig
             :j-hui/fidget.nvim
             :glepnir/lspsaga.nvim
             :nvim-lua/plenary.nvim
             :nvim-lua/popup.nvim
             :nvim-telescope/telescope.nvim
             :kyazdani42/nvim-web-devicons
             :lewis6991/gitsigns.nvim
             :romgrk/barbar.nvim
             :folke/zen-mode.nvim
             :folke/which-key.nvim
             :folke/trouble.nvim
             :Olical/conjure
             :eraserhd/parinfer-rust
             :windwp/nvim-autopairs
             :nvim-treesitter/nvim-treesitter
             :nvim-treesitter/nvim-treesitter-textobjects
             :p00f/nvim-ts-rainbow
             :SmiteshP/nvim-navic
             :timuntersberger/neogit
             :nvim-neorg/neorg
             :numToStr/Comment.nvim
             {:url "https://git.sr.ht/~whynothugo/lsp_lines.nvim"}
             {:url "https://git.sr.ht/~technomancy/fnlfmt"}
             :kyazdani42/nvim-tree.lua
             :norcalli/nvim-colorizer.lua
             :ms-jpq/coq_nvim
             :ms-jpq/coq.artifacts
             :ThePrimeagen/refactoring.nvim
             :b0o/incline.nvim
             :tamton-aquib/staline.nvim
             :krapjost/tmb
             :ggandor/leap.nvim])

((require :paq) pkgs)

(setup settings :Comment :nvim-treesitter.configs :nvim-tree :nvim-autopairs
       :lsp_lines :colorizer :leap :zen-mode :trouble :neorg :incline :staline
       :refactoring :telescope :fidget)

(local telescope (preq :telescope))
(telescope.load_extension :refactoring)

(fn lsp-setup []
  (local lspconf (preq :lspconfig))
  (local coq (preq :coq))
  (each [_ server (ipairs servers)]
    (local settings
           {:on_attach (fn [client bufnr]
                         (let [capa client.server_capabilities
                               navic (require :nvim-navic)
                               saga (require :lspsaga)
                               opts {:noremap true :silent true :buffer bufnr}]
                           (navic.attach client bufnr)
                           (saga.init_lsp_saga {:saga_winblend 10
                                                :symbol_in_winbar {:in_custom true
                                                                   :enable true
                                                                   :separator " "
                                                                   :show_file true
                                                                   :click_support false}})
                           (set-key :n :gD vim.lsp.buf.declaration opts)
                           (set-key :n :gd
                                    "<cmd>Lspsaga preview_definition<CR>" opts)
                           (set-key :n :gi vim.lsp.buf.implementation opts)
                           (set-key :n :gr vim.lsp.buf.references opts)
                           (set-key :n :K "<cmd>Lspsaga hover_doc<CR>" opts)
                           (set-key :n :gh "<cmd>Lspsaga lsp_finder<CR>" opts)
                           (set-key :n :<C-k> vim.lsp.buf.signature_help opts)
                           (set-key :n "<leader>'" ":LSoutlineToggle<CR>" opts)
                           (set-key :n :<leader>D vim.lsp.buf.type_definition
                                    opts)
                           (set-key :n :<leader>rn "<cmd>Lspsaga rename<CR>"
                                    opts)
                           (set-key :n :<leader>ca
                                    "<cmd>Lspsaga code_action<CR>" opts)
                           (set-key :v :<leader>ca
                                    "<cmd><C-U>Lspsaga range_code_action<CR>"
                                    opts)
                           (set-key :n :<leader>wa
                                    vim.lsp.buf.add_workspace_folder opts)
                           (set-key :n :<leader>wr
                                    vim.lsp.buf.remove_workspace_folder opts)
                           (set-key :n :<leader>wl
                                    (fn []
                                      (print (vim.inspect (vim.lsp.buf.list_workspace_folders))))
                                    opts)
                           (when capa.documentFormattingProvider
                             (vim.api.nvim_create_autocmd :BufWritePre
                                                          {:buffer bufnr
                                                           :desc :format-on-save
                                                           :command "lua vim.lsp.buf.format()"}))))})
    (local a (. lspconf server))
    (-> (coq.lsp_ensure_capabilities settings) (a.setup))))

(fn set-leap-keymap []
  (local l (require :leap))
  (l.set_default_keymaps))

(lsp-setup)
(set-leap-keymap)

;; (fn get-file-name [include-path]
;;   (local symbol (require :lspsaga.symbolwinbar))
;;   (local file-name (symbol.get_file_name)
;;          (when (= (vim.fn.bufname "%") "")
;;            "") (when (= include-path false)
;;                      file-name)
;;          (local uname (vim.loop.os_uname))
;;          (local sep (if (= uname.sysname :Windows) "\\" "/"))
;;          (local path-list
;;                 (vim.split (string.gsub (vim.fn.expand "%:~.:h" "%%" "") sep)))
;;          (var file-path "")
;;          (icollection [_ cur (ipairs path_list)] (set file-path))))

;; local function get_file_name(include_path)
;;     local file_name = require('lspsaga.symbolwinbar').get_file_name()
;;     if vim.fn.bufname '%' == '' then return '' end
;;     if include_path == false then return file_name end
;;     -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
;;     local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
;;     local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
;;     local file_path = ''
;;     for _, cur in ipairs(path_list) do
;;         file_path = (cur == '.' or cur == '~') and '' or
;;                     file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
;;     end
;;     return file_path .. file_name
;; end

;; local function config_winbar()
;;     local exclude = {
;;                      ['teminal'] = true,
;;                      ['toggleterm'] = true,
;;                      ['prompt'] = true,
;;                      ['NvimTree'] = true,
;;                      ['help'] = true,}
;;      -- Ignore float windows and exclude filetype
;;     if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
;;         vim.wo.winbar = ''
;;     else
;;         local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
;;         local sym
;;         if ok then sym = lspsaga.get_symbol_node() end
;;         local win_val = ''
;;         win_val = get_file_name(true) -- set to true to include path
;;         if sym ~= nil then win_val = win_val .. sym end
;;         vim.wo.winbar = win_val
;;     end
;; end
;;
;; local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved'}
;;
;; vim.api.nvim_create_autocmd(events, {
;;                                      pattern = '*',
;;                                      callback = function() config_winbar() end,})
;;
;;
;; vim.api.nvim_create_autocmd('User', {
;;                                      pattern = 'LspsagaUpdateSymbol',
;;                                      callback = function() config_winbar() end,})
;;

(vim.api.nvim_create_autocmd :BufWritePost
                             {:pattern :*.fnl
                              :command "silent! !fnlfmt --fix %:p"})

;; which-key setup
(let [wk (preq :which-key)]
  (wk.register {:<leader> {}} {:prefix :<leader> :nowait true}))

(vim.cmd "colorscheme tommies_bathing")
