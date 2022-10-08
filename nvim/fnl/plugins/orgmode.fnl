(local orgmode (require :orgmode))
(orgmode.setup_ts_grammar)

(fn export-md [exporter]
  (local current_file (vim.api.nvim_buf_get_name 0))
  (local target (.. (vim.fn.fnamemodify current_file ":p:r") ".md"))
  (local command [:pandoc current_file "-o" target])
  (local on_success (fn [output] (vim.pretty_print output)))
  (local on_error (fn [err] (vim.pretty_print err)))
  (exporter command target on_success on_error))

:return {:org_agenda_files [ "~/Orgs/**/*"]
         :org_default_notes_file "~/Orgs/refile.org"
         :org_capture_templates {:j {:description "Journal"
                                     :template "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?"
                                     :target "~/sync/org/journal.org"}}
         :org_custom_exports {:f {:label "Export to md format"
                                  :action export-md}}}
