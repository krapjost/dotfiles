local colors = {
  none          = "NONE",
  fg            = "#6f907e",
  bg            = "#121614",
  alt_bg        = "#221b22",
  dark          = "#1b221e",
  accent        = "#d199cd",
  dark_gray     = "#2e242d",
  fg_gutter     = "#3a2c39",
  context       = "#574256",
  popup_back    = "#42574b",
  search_orange = "#70ba91",
  search_blue   = "#c09eda",
  gray          = "#42574b",
  light_gray    = "#6f907e",
  blue          = "#67a5f2",
  dark_blue     = "#418fef",
  green         = "#55dfa6",
  cyan          = "#3ecded",
  red           = "#d2737d",
  orange        = "#dc9299",
  -- light_red     = "#7ac4a6",
  yellow        = "#eea954",
  yellow_orange = "#debe97",
  -- #########
  purple         = "#a295d5",
  magenta        = "#8878c9",
  cursor_fg      = "#000000",
  cursor_bg      = "#70ba91",
  sign_add       = "#04fd96",
  sign_change    = "#ffa639",
  sign_delete    = "#ed4e5e",
  error_red      = "#ed4e5e",
  warning_orange = "#ffa639",
  info_yellow    = "#eea954",
  hint_blue      = "#418fef",
  purple_test    = "#b5b1c3",
  cyan_test      = "#85cad9",
  ui_blue        = "#87addc",
  diff_add       = "#7ac4a6",
  diff_delete    = "#caaeb0",
  diff_change    = "#debe97",
  diff_text      = "#b5b1c3",
  -- #########
  cx1 = "#ed4e5e",
  cx2 = "#04fd96",
  cx3 = "#ffa639",
  cx4 = "#2788ff",
  cx5 = "#7053e4",
  cx6 = "#22d6ff",
  -- #########
  cy1 = "#caaeb0",
  cy2 = "#7ac4a6",
  cy3 = "#debe97",
  cy4 = "#87addc",
  cy5 = "#b5b1c3",
  cy6 = "#85cad9",
  --
  cf1 = "#000000",
  cf2 = "#000000",
  cf3 = "#000000",
  cf4 = "#000000",
  cf5 = "#ffffff",
  cf6 = "#000000",
  --
  c00 = "#1b221e",
  c01 = "#d2737d",
  c02 = "#33d994",
  c03 = "#eea954",
  c04 = "#418fef",
  c05 = "#8878c9",
  c06 = "#3ecded",
  c07 = "#6f907e",
  c08 = "#42574b",
  c09 = "#dc9299",
  c10 = "#55dfa6",
  c11 = "#f2bb79",
  c12 = "#67a5f2",
  c13 = "#a295d5",
  c14 = "#63d7f0",
  c15 = "#aabbb2",

  sbg = "#d199cd",
  sfg = "#000000",
  wbg = "#70ba91",
  wfg = "#000000",
  ebg = "#c09eda",
  efg = "#000000",
  xbg = "#121614",
  xfg = "#6f907e",
  obg = "#2c3a32",
  ofg = "#8da598",
  wbx = "#7ae3a9",
  wfx = "#000000",

  sk0 = "#0b090b",
  sk1 = "#161216",
  sk2 = "#221b22",
  sk3 = "#2e242d",
  sk4 = "#3a2c39",
  sk5 = "#574256",
  sk6 = "#906f8e",
  sk7 = "#a58da4",
  sk8 = "#bbaaba",
  sk9 = "#d1c7d0",

  wk0 = "#090b0a",
  wk1 = "#121614",
  wk2 = "#1b221e",
  wk3 = "#242e28",
  wk4 = "#2c3a32",
  wk5 = "#42574b",
  wk6 = "#6f907e",
  wk7 = "#8da598",
  wk8 = "#aabbb2",
  wk9 = "#c7d1cb",

  ek0 = "#0a090b",
  ek1 = "#151216",
  ek2 = "#1f1b22",
  ek3 = "#29242e",
  ek4 = "#342c3a",
  ek5 = "#4e4257",
  ek6 = "#826f90",
  ek7 = "#9b8da5",
  ek8 = "#b4aabb",
  ek9 = "#cdc7d1"
}

-- -- ColorColumn
-- -- Conceal --concealed text
-- -- CurSearch --highlighting search pattern under the cursor
-- -- Cursor --Character under cursor
-- -- lCursor --Character under cursor when language-mapping is used
-- -- CursorIM --Cursor but used in IME mode
-- -- CursorColumn --Screen-column at the cursor, when cursorcolumn is set.
-- -- Directory -- diractory names
-- -- DiffAdd -- Diff mode added line
-- -- DiffChange -- Diff mode: changed line
-- -- DiffDelete -- Diff mode: deleted line
-- -- DiffText -- Diff mode: changed text within a changed line
-- -- EndOfBuffer -- Filler lines (~) after the end of the buffer
-- -- TermCursor -- Cursor in a focused term
-- -- TermCursorNC -- Cursor in an unnfocused term
-- -- ErrorMsg -- error messages on the command line
-- -- WinSeparator -- Separators between window splits
-- -- Folded -- Line used for closed folds
-- -- FoldColumn -- fold column
-- -- SignColumn -- Cloumn where signs are displayed
-- -- IncSearch -- incsearch highlighting; also text replaced with :s//c
-- -- Substitute -- :substitute replacement text highlighting
-- -- LineNr -- line number for :number and #
-- -- LineNrAbove -- line number for when the relativenumber option is set, above cursor line
-- -- LineNrBelow -- line number for when the relnu is set, below line
-- CursorLineNr	Like LineNr when 'cursorline' is set and 'cursorlineopt'
-- CursorLineSign	Like SignColumn when 'cursorline' is set for the cursor line.
-- CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
-- MatchParen	Character under the cursor or just before it, if it
-- ModeMsg		'showmode' message (e.g., "-- INSERT --").
-- MsgArea		Area for messages and cmdline.
-- MsgSeparator	Separator for scrolled messages, `msgsep` flag of 'display'.
-- MoreMsg		|more-prompt|
-- NonText		'@' at the end of the window, characters from 'showbreak'
-- Normal		Normal text.
-- NormalFloat	Normal text in floating windows.
-- NormalNC	Normal text in non-current windows.
-- Pmenu		Popup menu: Normal item.
-- PmenuSel	Popup menu: Selected item.
-- PmenuSbar	Popup menu: Scrollbar.
-- PmenuThumb	Popup menu: Thumb of the scrollbar.
-- Question	|hit-enter| prompt and yes/no questions.
-- QuickFixLine	Current |quickfix| item in the quickfix window. Combined with
-- Search		Last search pattern highlighting (see 'hlsearch').
-- SpecialKey	Unprintable characters: Text displayed differently from what
-- SpellBad	Word that is not recognized by the spellchecker. |spell|
-- SpellCap	Word that should start with a capital. |spell|
-- SpellLocal	Word that is recognized by the spellchecker as one that is
-- SpellRare	Word that is recognized by the spellchecker as one that is
-- StatusLine	Status line of current window.
-- StatusLineNC	Status lines of not-current windows.
-- TabLine		Tab pages line, not active tab page label.
-- TabLineFill	Tab pages line, where there are no labels.
-- TabLineSel	Tab pages line, active tab page label.
-- Title		Titles for output from ":set all", ":autocmd" etc.
-- Visual		Visual mode selection.
-- VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
-- WarningMsg	Warning messages.
-- Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail"
-- WildMenu	Current match in 'wildmenu' completion.
-- WinBar		Window bar of current window.
-- WinBarNC	Window bar of not-current windows.
-- Menu		Current font, background and foreground colors of the menus.
-- Scrollbar	Current background and foreground of the main window's
-- Tooltip		Current font, background and foreground of the tooltips.


vim.api.nvim_set_hl(0, 'Normal', {fg=colors.fg, bg=colors.bg})
vim.api.nvim_set_hl(0, 'LineNr', {fg=colors.fg, bg=colors.dark})
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg=colors.fg, bg=colors.dark})
vim.api.nvim_set_hl(0, 'LineNrAbove', {fg=colors.fg, bg=colors.bg})
vim.api.nvim_set_hl(0, 'LineNrBelow', {fg=colors.fg, bg=colors.bg})
vim.api.nvim_set_hl(0, 'Cursor', {bg=colors.wbx, fg=colors.diff_add})

return colors
