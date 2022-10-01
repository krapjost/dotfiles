:return

{:kind :split :popup {:kind :floating}}

;; kind = "tab",
;; -- Change the default way of opening the commit popup
;; commit_popup = {
;;                 kind = "split",}
;;   ,
;;   -- Change the default way of opening popups
;;   popup = {
;;            kind = "split",}
;;   ,
;;   -- customize displayed signs
;;   signs = {
;;            -- { CLOSED, OPENED}
;;            section = { ">", "v" },
;;            item = { ">", "v" },
;;            hunk = { "", "" },}
;;   ,
;;   integrations = {
;;                   -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
;;                   -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
;;                   --
;;                   -- Requires you to have `sindrets/diffview.nvim` installed.
;;                   -- use { 
;;                           --   'TimUntersberger/neogit', 
;;                           --   requires = { 
;;                                            --     'nvim-lua/plenary.nvim',
;;                                            --     'sindrets/diffview.nvim' 
;;                                            --}
;;                           --}
;;                   --
;;                   diffview = false}  
;;   ,
