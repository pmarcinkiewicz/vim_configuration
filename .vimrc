
" Maintainer:  Dominique Pelle <dominique.pelle at gmail.com>
" Last Change: 01 Jun 2009
" URL:         http://dominique.pelle.free.fr/.vimrc
"
" Tested with Vim-7.2 (tiny, small, large, big, huge) and Vim-6.4
"
" Unset g:color_names to avoid loading color scheme several times
" when sourcing ~/.virmc a second time. Several commands would trigger
" sourcing color scheme :syntax on and :set t_Co=256 and of course
" command :colorscheme itself.
sil! unset g:colors_name

if has('multi_byte')
  scriptencoding utf-8
  set enc=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
  if version >= 700
    set lcs=tab:»·,trail:·,eol:¶,extends:>,precedes:<,nbsp:×
  else
    set lcs=tab:»·,trail:·,eol:¶,extends:>,precedes:<
  endif
endif

if has('syntax')
  syntax on
endif
if has('autocmd')
  filetype on
  filetype plugin on
endif

if has('gui_running')
  if has("win16") || has("win32") || has("win95") || has("win64")
    set guifont=Lucida\ Console:h10
  else
    " See http://dominiko.livejournal.com/16547.html to use this font.
    set guifont=MiscFixed\ Semi-Condensed\ 10
  endif
  if has('toolbar')
    if     has('gui_gtk2')  || has('gui_gtk')
      \ || has('gui_motif') || has('gui_athena') || has('gui_photon')
      set tb=icons
      if has('gui_gtk2') | set tbis=tiny | endif
    endif
  endif
else
  if has('eval') | let Tlist_Inc_Winwidth=0 | endif
endif


" I don't want to use synch too often on a laptop.
if version >= 700 | set nofsync | endif

" Don't wait 1s when pressing <esc>
set timeout timeoutlen=3000 ttimeoutlen=100

set nocompatible
set history=400
set textwidth=0
set backup

" I don't like 'set mouse=a' behavior because it changes the position of
" the cursor when clicking in a window to give it focus.  I prefer
" 'set mouse=vic'.
" if has('mouse') | set mouse=vic | endif

set wildmode=longest,list
set wildmenu

set splitbelow
set hidden
set nostartofline
set cpoptions=ces$
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set wrap
set showbreak=:
set laststatus=2
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set smarttab
set expandtab
set ignorecase
set smartcase
set cino:0
set comments=sr:/*,mb:*,ex:*/
set formatoptions=tcqor
" set showfulltag
if has('netbeans_intg') || has('sun_workshop')
  set autochdir
endif

set visualbell
if has('cmdline_info')
  set ruler
  set showcmd
endif
set nonumber
set showmatch
if has('extra_search')
  set hlsearch
  set incsearch
endif
set nolist
set matchpairs+=<:>
set virtualedit=block
set display=lastline,uhex

set tags=/tags,~/tags,tags
set thesaurus=~/mthesaur.txt

if has('cscope')
  if filereadable(expand("$HOME/cscope.out"))
    cs kill -1
    cs add ~/cscope.out
  endif
  set cscopeverbose

  " Put output of cscope in quickfix window (use :copen)
  set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

set makeprg=make\ VERBOSE=\ DEBUG=yes

if has('eval')
  let g:load_doxygen_syntax=1
  let g:is_posix=1
  let g:c_gnu=1
  let g:netrw_special_syntax= 1
endif

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv

noremap <c-]> g<c-]>
noremap <c-g> g<c-g>

" These mappings are useful in long wrapped lines when pressing <down> or <up>
" Use j or k to get the default behavior.
noremap <down> g<down>
noremap <up>   g<up>

 map <F2>      :set paste!<CR>:set paste?<CR>
imap <F2> <C-O>:set paste<CR>:set paste?<CR>
 map <F3>      :set number!<CR>:set number?<CR>
imap <F3> <C-O>:set number!<CR><C-O>:set number?<CR>
 map <F4>      :set hlsearch!<CR>:set hlsearch?<CR>
imap <F4> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>
 map <F5>      :set list!<CR>:set list?<CR>
imap <F5> <C-O>:set list!<CR><C-O>:set list?<CR>
"Disabled - doesn't work
"nnoremap <silent> <F6> :TlistToggle<CR>

if has('spell')
  set spell

  if has('eval')
    " Change language of spelling checker.
    let g:myLang = 0
    let g:myLangList = [ "en_gb", "pl"]
    let g:lingvoj= [ "język", "language:"]
    function! MySpellLang()
      let g:myLang = g:myLang + 1
      if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif

      if g:myLang == 0 | setlocal spell spelllang=en_gb | endif
      if g:myLang == 1 | setlocal spell spelllang=pl | endif
     " if g:myLang == 1 | setlocal spell spelllang=eo    | endif
     " if g:myLang == 2 | setlocal spell spelllang=fr    | endif
     " if g:myLang == 3 | setlocal spell spelllang=it    | endif
     " if g:myLang == 4 | setlocal spell spelllang=br    | endif

      echo g:lingvoj[g:myLang] g:myLangList[g:myLang]
    endf

    map  <F7>      :call MySpellLang()<CR>
    imap <F7> <C-o>:call MySpellLang()<CR>
  endif
  map  <F8> :set spell!<CR>
endif

" Tip #750: http://vim.wikia.com/wiki/VimTip750
" Underline the current line.
nnoremap <F9> yyp<c-v>$r-
inoremap <F9> <esc>yyp<c-v>$r-A

" Disabled as nor working correctly
" Tip #99: display syntax group under the cursor.
"map  <F10> :echo "hi<"
"\ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
"\ . ">"<CR>

" Reloads syntax hight light from start
noremap <F11> <Esc>:syntax sync fromstart<CR>
inoremap <F11> <C-o>:syntax sync fromstart<CR>

map  <F12> :!ctags -R --c++-kinds=+p --fields=+iaSn --extra=+q .<CR>

" Following mappings allow to cut undo to reduce granularity of
" undos. See also:
"   http://vim.wikia.com/wiki/Modified_undo_behavior
inoremap <c-u>   <c-g>u<c-u>
inoremap <c-w>   <c-g>u<c-w>
inoremap <bs>    <c-g>u<bs>
inoremap <del>   <c-g>u<del>
inoremap <tab>   <tab><c-g>u
"imap     <space> <space><c-g>u
if has('autocmd')
  " Undo break if I don't press a key in insert mode for a few seconds.
  au CursorHoldI * call feedkeys("\<C-G>u", "nt")
endif

" Increase undolevel because of above mappings.
set undolevels=3000

" Function used to display syntax group.
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Function used to display utf-8 sequence.
fun! ShowUtf8Sequence()
  try
    let p = getpos('.')
    redir => utfseq
    sil normal! g8
    redir End
    call setpos('.', p)
    return substitute(matchstr(utfseq, '\x\+ .*\x'), '\<\x', '0x&', 'g')
  catch
    return '?'
  endtry
endfunction

if has('statusline')
  if version >= 700
    " Fancy status line.
    set statusline =
    set statusline+=%#User1#                       " highlighting
    set statusline+=%-2.2n\                        " buffer number
    set statusline+=%#User2#                       " highlighting
    set statusline+=%f\                            " file name
    set statusline+=%#User1#                       " highlighting
    set statusline+=%h%m%r%w\                      " flags
    set statusline+=%{(&key==\"\"?\"\":\"encr,\")} " encrypted?
    set statusline+=%{strlen(&ft)?&ft:'none'},     " file type
    set statusline+=%{(&fenc==\"\"?&enc:&fenc)},   " encoding
    set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
    set statusline+=%{&fileformat},                " file format
    set statusline+=%{&spelllang},                 " spell language
    set statusline+=%{SyntaxItem()}                " syntax group under cursor
    set statusline+=%=                             " indent right
    set statusline+=%#User2#                       " highlighting
    set statusline+=%{ShowUtf8Sequence()}\         " utf-8 sequence
    set statusline+=%#User1#                       " highlighting
    set statusline+=0x%B\                          " char under cursor
    set statusline+=%-6.(%l,%c%V%)\ %<%P           " position

    " Use different colors for statusline in current and non-current window.
    let g:Active_statusline=&g:statusline
    let g:NCstatusline=substitute(
      \                substitute(g:Active_statusline,
      \                'User1', 'User3', 'g'),
      \                'User2', 'User4', 'g')
    au WinEnter * let&l:statusline = g:Active_statusline
    au WinLeave * let&l:statusline = g:NCstatusline
  endif
endif

iab 8< --- 8< --- cut here --- 8< --- cut here --- 8< ---
iab fori for (i = 0; i <; i++)<cr>{<cr>}<Esc>kk0f<a
iab forj for (j = 0; j <; j++)<cr>{<cr>}<Esc>kk0f<a
iab cfunc ///<cr>/// \\brief<cr>///<esc>kA

if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

if has('autocmd')
  " Source .vimrc when I write it.  The nested keyword allows
  " autocommand ColorScheme to fire when sourcing ~/.vimrc.
  au! BufWritePost .vimrc nested source %

  " Change color of cursor in terminal:
  " - red in normal mode.
  " - orange in insert mode.
  " Tip found there:
  "   http://forums.macosxhints.com/archive/index.php/t-49708.html
  " It works at least with: xterm rxvt eterm
  " But do nothing with: gnome-terminal terminator konsole xfce4-terminal
  if version >= 700
    if &term =~ "xterm\\|rxvt"
      :silent !echo -ne "\033]12;red\007"
      let &t_SI = "\033]12;orange\007"
      let &t_EI = "\033]12;red\007"
      au VimLeave * :sil !echo -ne "\033]12;red\007"
    endif
  endif
endif


" It fails for VIM in macos
"""""""""""""""""""""""""""""""
"
"" See http://vim.wikia.com/wiki/Using_GUI_color_settings_in_a_terminal
"" Cygwin terminal does not support 256 colors but vim insider xterm
"" with cygwin does support 256 colors.
"if version >= 700 && !has('gui_running') && &term != 'cygwin'
"  " In the terminal, try to use CSApprox.vim plugin or guicolorscheme.vim
"  " plugin if possible in order to have consistent colors on different
"  " terminals.
"  "
"  " Uncomment one of the following line to force 256 or 88 colors if
"  " your terminal supports it.  Or comment both of them if your terminal
"  " supports neither 256 nor 88 colors.
"  set t_Co=256
"  "set t_Co=88
"
"  if &t_Co == 256 || &t_Co == 88
"    " Check whether to use CSApprox.vim plugin or guicolorscheme.vim plugin.
"    " The 2 plugins have their pros and cons:
"    "
"    " - CSApprox.vim is more robust since it does not rely on parsing
"    "   the colorscheme file.
"    " - CSApprox.vim is better documented and more configurable.
"    " - CSApprox.vim does not rely on a hack to load it.
"    "
"    " - guicolorscheme.vim is faster.
"    " - guicolorscheme.vim does not require +gui feature being built in Vim.
"    "
"    if has('gui') &&
"      \ (filereadable(expand("$HOME/.vim/plugin/CSApprox.vim")) ||
"      \  filereadable(expand("$HOME/vimfiles/plugin/CSApprox.vim")))
"      let s:use_CSApprox = 1
"    elseif filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim")) ||
"      \    filereadable(expand("$HOME/vimfiles/plugin/guicolorscheme.vim"))
"      let s:use_guicolorscheme = 1
"    endif
"  endif
"endif

" rastafari colorscheme available at:
"   http://dominique.pelle.free.fr/rastafari.vim
if exists('s:use_CSApprox')
  " Can use the CSApprox.vim plugin.
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
  colorscheme rastafari
elseif exists('s:use_guicolorscheme')
  " Can use the guicolorscheme plugin. It needs to be loaded before
  " running GuiColorScheme (hence the :runtime! command).
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme rastafari
else
  colorscheme rastafari
endif

if has('syntax')
  if &t_Co >= 88
    set cul
  endif
endif

" map Mac OS X Terminal.app default Home and End
map <ESC>[H <Home>
map <ESC>[F <End>
imap <ESC>[H <C-O><Home>
imap <ESC>[F <C-O><End>
cmap <ESC>[H <Home>
cmap <ESC>[F <End>


let &colorcolumn=join(range(81,81),",")
syn on

" Enable to load cscope database
"set nocscopeverbose
"cscope add ~/.cscope.out /your_path_to_sources

