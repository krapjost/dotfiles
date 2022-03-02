return function()
   require("true-zen").setup {
      ui = {
         top = {
            showtabline = 0,
         },
         left = {
            number = true,
            relativenumber = true,
         },
      },
      modes = {
         ataraxis = {
            left_padding = 32,
            right_padding = 32,
            top_padding = 1,
            bottom_padding = 1,
            ideal_writing_area_width = { 0 },
            auto_padding = true,
            keep_default_fold_fillchars = true,
            custom_bg = { "none", "" },
            bg_configuration = true,
            quit = "untoggle",
            ignore_floating_windows = true,
            affected_higroups = {
               NonText = true,
               FoldColumn = true,
               ColorColumn = true,
               VertSplit = true,
               StatusLine = true,
               StatusLineNC = true,
               SignColumn = true,
            },
         },
      },
   }
end
