syntax on
set number
set ruler
set incsearch
set hlsearch
colorscheme elflord

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

set list
set listchars=tab:».,trail:.,eol:«
hi NonText ctermfg=255 guifg=#eeeeee
hi SpecialKey ctermfg=255 guifg=#eeeeee

" set pastetoggle=<F2>
" set commentstring=(*%s*)
" set so=200
" set foldmethod=marker

" nnoremap <CR> :noh <CR>
" nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" nmap + :put=''<CR>
" nmap - :put!=''<CR>
" nmap <C-PageUp> gT
" nmap <C-PageDown> gt
" nmap OH gT
" nmap OF gt
" nmap <C-s> :update<CR>
" nmap <C-x> :update<CR>:q<CR>
" nmap <C-F5> :!clear<CR>:!gcc -Wall uniq.c<CR>
" nmap <C-F6> :!clear<CR>:!./a.out testfile<CR>
" nmap ** :!clear; grep `echo <cword>` *.ml -n<CR>

" fun BenIndent()
"  let oldLine=line('.')
"   normal(gg=G)
"    execute ':' . oldLine
"    endfun
" map -- :call BenIndent()<CR>
