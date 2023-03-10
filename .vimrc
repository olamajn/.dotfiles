" General settings {{{

" Set{{{

" Do not save backup files
set nobackup

" Set ruler
set ruler

" Line number
set number

" Discontinue comments on new line
" This is also set in /usr/share/vim/vim82/ftplugin/vim.vim to "fo=croql"
" so it has to be set in .vim/after/ftplugin/vim.vim
set formatoptions=cql

" Highlight search incrementally
set hlsearch incsearch
"}}}

" Leader key{{{

" Leader
let mapleader = ","

" Localleader
let maplocalleader = "\\"


"}}}

" Mappings{{{

" Normal Mode{{{

" Move line downwards
nnoremap - ddp

" Move line upwards
nnoremap _ ddkP

" Uppercase word
nnoremap <leader>u lbveU

" Lowercase word
nnoremap <leader>l lbveu

" Capitalize word 
nnoremap <leader>c lbvUlveuh

" Edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Source buffer
nnoremap <leader>sb :source %<cr>

" Beginning of line
nnoremap H 0

" End of line
nnoremap L <end>

" Toggle fold
nnoremap <space> za

" Indentaion: simpler and reversed
nnoremap > << 
nnoremap < >>

" Write
nnoremap ww :write<cr>

" Window below
nnoremap <c-j> <c-w><c-j>

" Window above
nnoremap <C-K> <C-W><C-K>

" Window left
nnoremap <c-h> <c-w><c-h>

" Window right
nnoremap <c-l> <c-w><c-l>

" Close window
nnoremap <c-q> <c-w>q

" Only window
nnoremap <c-o> <c-w>o

" Disable arrowkeys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Double delete, single undo
nnoremap <leader>d ddi<c-g>u<esc>dd

" Very magic search
nnoremap 7 /\v

" Clear search highlight
nnoremap <s-7> :nohlsearch<cr>

" Trailing whitespace
nnoremap <leader>w :match Error /\v $/<cr>
nnoremap <leader>W :match none<cr>

" Grep search 
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" Next result
nnoremap <s-j> :cnext<cr>

" Previous result
nnoremap <s-k> :cprevious<cr>

" Close cwindow
nnoremap <leader>cc :cclose<cr>

" Movement same for wrap/lines
nnoremap j gj
nnoremap k gk

"}}}

" Insert Mode{{{

" Delete current line
inoremap <leader>d <esc>ddi

" Clear current line
inoremap <leader>c <esc>ddO

" Uppercase word
inoremap <leader>u <esc>llbveUi

" lowercase word
inoremap <leader>l  <esc>llbveui

" Escape
inoremap jk <esc>
inoremap <esc> <nop>

" Disable arrowkeys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"}}}

" Visual Mode{{{

" Quote text
vnoremap <leader>" di""<esc>hp

" Escape
vnoremap jk <esc> 
vnoremap <esc> <nop>

" End of line
vnoremap L $

" Beginning of line
vnoremap H 0

" Indentaion: simpler and reversed
vnoremap > < 
vnoremap < >

"}}}

" Operator{{{

" Parenthesis
onoremap p i(
onoremap P a(

" Next parenthesis
onoremap in( :<c-u>normal! f(vi(<cr>

" Previous parenthesis
onoremap il( :<c-u>normal! F)vi(<cr>h 

" Block
onoremap b i{
onoremap B a{

" Next block
onoremap in{ :<c-u>normal! f{vi{<cr>

" Previous block
onoremap il{ :<c-u>normal! F}vi{<cr>h 

" Tag
onoremap t it
onoremap T at

" Next email address
onoremap in@ :<c-u>execute "normal! /[0-z-._]\\+@\\w\\+.\\w\\+\r:nohlsearch\rvt@"<cr>

" Previous email address
onoremap il@ :<c-u>execute "normal! ?[0-z-._]\\+@\\w\\+.\\w\\+\r:nohlsearch\rvt@"<cr>

" End of line
onoremap L $

" Beginning of line
onoremap H 0

"}}}
"}}}
"}}}

" Abbreviations{{{
iabbrev waht what
iabbrev tehn then
"}}}

" Vimscript file settings {{{

" Vim{{{

augroup filetype_vim
	autocmd!
	autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
	autocmd Filetype vim setlocal foldmethod=marker
augroup END

"}}}

" Python{{{

augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
augroup END

"}}}

" HTML{{{

augroup filetype_html
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
	autocmd FileType html setlocal nowrap
augroup END

"}}}

" LaTeX{{{

augroup filetype_tex
	autocmd!
	autocmd FileType tex nnoremap <buffer> <localleader>c I% <esc>
augroup END

"}}}
"}}}

" Status line{{{

set statusline=%.20F  		" Path to file
set statusline+=\ -\  		" Separator
set statusline+=FileType: 	" Label
set statusline+=%y		" Filetype
set statusline+=%=		" Switch to rightside
set statusline+=Current:\ 	" Label 
set statusline+=%-4l		" Current line
set statusline+=\ 		" Separator
set statusline+=Total:\ 	" Label
set statusline+=%-4L		" Total lines

"}}}

set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.



" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " Change working folder when reading file
  autocmd BufEnter * silent! lcd %:p:h
augroup END

" PLUGINS ----------------- {{{1

" vim-plug ---------------- {{{2
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe', { 'for': ['python'] }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/tagalong.vim'
call plug#end()

" }}}
" UltiSnips -------------- {{{2
let g:UltiSnipsExpandTrigger = '<tab>' " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'vim/UltiSnips', 'UltiSnips']

" Edit snippets in new window
let g:UltiSnipsEditSplit="vertical"

" Refresh snippets 
nnoremap <leader>su <Cmd>call UltiSnips#RefreshSnippets()<CR>

" Edit snippets
nnoremap <leader>eu :UltiSnipsEdit<cr>
" }}}
" NERDTree --------------------- {{{2
nnoremap <leader>n :NERDTreeToggle<CR>
" augroup NERDTree
	" au!
	" autocmd VimEnter * NERDTree
" }}}
"YouCompleteMe{{{2
map <leader>gtd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}}
" VimTex ------------------ {{{2
" LaTex is tex filetype
let g:tex_flavor = "latex"
" }}}
" Emmet-vim --------------------- {{{2
" Trigget key config
let g:user_emmet_leader_key=','
" }}}
" }}}
