" ALE
let g:ale_fix_on_save = 1
let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_fixers["javascript"] = ["prettier"]
let g:ale_linters["javascript"] = ["eslint"]
let g:ale_fixers["typescript"] = ["prettier"]
let g:ale_linters["typescript"] = ["eslint", "tslint"]
