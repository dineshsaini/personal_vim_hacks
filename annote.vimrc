" Use Vim defaults instead of 100% vi compatibility
" Avoid side-effects when nocompatible has already been set.
if &compatible
  set nocompatible
endif


" highlighting comments for annote notes 
highlight cmnts ctermfg=DarkGrey
match cmnts /^\s*\(##\)\?@[0-9.*-]*! .*/

" highlights for sub heading and back references
highlight subheads ctermfg=DarkGreen
2match subheads /\(^\s*#@[0-9]\+[0-9.]*[0-9]\+ .*\|@{[0-9.]\+}\|@\[[^]]\+\]\)/

