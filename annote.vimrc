" highlighting comments for annote notes 
highlight comments ctermfg=DarkGrey
au BufRead *.note match comments /^\s*\(##\)\?@[0-9.*-]*! .*/

" highlights for sub heading and back references
highlight subheads ctermfg=DarkGreen
au BufRead *.note 2match subheads /\(^\s*#@[0-9]\+[0-9.]*[0-9]\+ .*\|@{[0-9.]\+}\|@\[[^]]\+\]\)/

