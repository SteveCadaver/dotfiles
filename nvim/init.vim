
" Required:
call plug#begin("~/.config/nvim/plugged")

Plug 'joshdick/onedark.vim'
"Plug 'dag/vim-fish'
Plug 'neovim/nvim-lspconfig'

Plug 'cespare/vim-toml'
Plug 'slim-template/vim-slim'

" git 
Plug 'airblade/vim-gitgutter'

" utility
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'moll/vim-node'
Plug 'mtdl9/vim-log-highlighting'
"Plug 'dense-analysis/ale'

" Rust-Lang
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" Split window
nmap sf :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab>   :tabnext<Return>

" Preview Markdown
map <Leader>p :!preview <c-r>%<CR><CR>

" Toggle autocompile
map <Leader>a :!setsid autocomp % &<CR>

"******************************************************************************
"" Basic Setup
"******************************************************************************

syntax on
" Colourscheme
colorscheme onedark
" Enable current line number and relative line numbers
set number relativenumber
set ruler

" Indent 
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Filetype specific indentation.
au FileType python set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
"au FileType rust set shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab

au VimLeave * :!clear

set t_ti=""
set list

set listchars=trail:●,tab:\|\ ,space:·
set clipboard=unnamed
set mouse=a
highlight LineNr ctermfg=DarkGrey
"let g:deoplete#enable_at_startup = 1

"******************************************************************************
"" Rust Language Server 
"******************************************************************************

if executable('rls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'allowlist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
"let g:ale_completion_enabled = 0

" LSP configuration
"lua << END
"local lspconfig = require('lspconfig')
"local on_attach = function(client, bufnr)
"  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
"
"  --Enable completion triggered by <c-x><c-o>
"  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
"
"  -- Mappings.
"  local opts = { noremap=true, silent=true }
"
"  -- See `:help vim.lsp.*` for documentation on any of the below functions
"  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
"  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"
"  -- Forward to other plugins
"  require'completion'.on_attach(client)
"end
"
"local servers = { "rust_analyzer" }
"for _, lsp in ipairs(servers) do
"  lspconfig[lsp].setup {
"    on_attach = on_attach,
"    flags = {
"      debounce_text_changes = 150,
"    }
"  }
"end
"
"vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"  vim.lsp.diagnostic.on_publish_diagnostics, {
"    virtual_text = true,
"    signs = true,
"    update_in_insert = true,
"  }
")
"END
"
