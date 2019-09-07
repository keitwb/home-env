map <C-]> <Plug>(TsuquyomiDefinition)
nnoremap <Leader>im :TsuImport<CR>
nnoremap <Leader>def :TsuDefinition<CR>
nnoremap <Leader>qf :TsuQuickFix<CR>
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1

let b:ale_fixers = ['tslint', 'prettier']

