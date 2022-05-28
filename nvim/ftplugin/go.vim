set noexpandtab

let g:go_fmt_command = "goimports"
let g:ale_go_govet_options = "-composites=false"
let g:ale_linters = {'go': ['gobuild', 'golangci-lint']}
let g:ale_go_golangci_lint_package = 1
