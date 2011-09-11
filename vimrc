set nocompatible
set secure
"set encoding=big5
set encoding=utf8
"set termencoding=utf8
set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
"set dictionary=~/.dict  " my dictionary :p

set expandtab           " expand tabs to spaces.
set wildchar=<TAB>      " such as <TAB> in shell
"set smarttab
set tabstop=2
set shiftwidth=2

set t_Co=8              " number of colors
set t_Sf=^[[1;3%p1%dm   " set foreground color
set t_Sb=^[[1;4%p1%dm   " set background color
set showcmd             " show command
set showmode            " show current mode
set incsearch           " While typing a search pattern, show immediately
                        " where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern,
                        " highlight all its matches.
syntax on               " show parts of the text in another font or color
set vb                  " turn off beep

autocmd FileType c,cpp,cc,java call PROG()
function PROG()
    set showmatch
    set nosmartindent
    set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
    set cinoptions=t0
    imap <C-a>f <END><CR>for(;;) {<CR>}<LEFT>
                \<CR><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
    imap <C-a>w <END><CR>while( ) {<CR>}<LEFT>
                \<CR><UP><UP><UP><END><LEFT><LEFT>
    set formatoptions=tcqr
endfunction


highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

map <F2> :update<CR>                    " using :update to replace :w
map <F3> :update<CR>:q<CR>
map <F4> :q!<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F8> :set hls!<BAR>set hls?<CR>     " toggle on/off highlightsearch
map <F9> :set paste!<BAR>set paste?<CR> " toggle on/off paste mode
set pastetoggle=<F9>

map <F7> :if exists("syntax_on") <BAR>  " press <F7> syntax on/off
        \   syntax off <bar><cr>
        \ else <BAR>
        \   syntax on <BAR>
        \ endif <CR>

map <F10> <ESC>:read !date<CR>
"smart mapping for tab completion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>


au BufRead,BufNewFile *.html,*.tpl,*.htm set filetype=smarty


""" let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
"let &titlestring = "" . expand("%:t") . ""
"let &titleold='csh'
"if &term =="screen"
"  set t_ts=^[k
"  set t_fs=^[\
"endif
"if &term == "screen" || &term == "xterm"
"     set title
"endif

""" scroll to last line you edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
au BufRead,BufNewFile *.html,*.tpl,*.htm set filetype=smarty

set laststatus=2
set statusline=%4*%=%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
"highlight User2 term=underline cterm=underline ctermfg=green
"highlight User3 term=underline cterm=underline ctermfg=yellow
"highlight User4 term=underline cterm=underline ctermfg=white
highlight User2 ctermfg=green
highlight User3 ctermfg=yellow
highlight User4 ctermfg=white
highlight User5 ctermfg=cyan
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white
