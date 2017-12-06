"set cursorline      "편집 위치에 커서 라인 설정
set number	"line 번호 표시
set ai		"auto indent
set si		"smart indent
set cindent	"c syle indent
set shiftwidth=4	"shift를 4칸으로
set tabstop=4	"tab을 4칸으로
set ignorecase	"검색시 대소문자 구별하지 않음
set hlsearch	"검색시 하이라이트
set expandtab	"tab 대신 띄어쓰기로
set nobackup	"백업 파일을 만들지 않음
set title	"제목 표시
set showmatch	"매칭되는 괄호 보여줌
set wmnu	"tab자동 완성시 가능한 목록을 보여줌
set laststatus=2    "상태바 표시를 항상 함
set background=dark
set backspace=eol,start,indent  "줄의 끝, 시작, 들여쓰기에서 백스페이스 시 이전줄로
set history=1000    "vi 편집기록 기억갯수 에 기록
highlight Comment term=bold cterm=bold ctermfg=4 "코멘트 하이라이트
set mouse=a         "vim에서 마우스 사용
set t_Co=256        "색 조정
set term=screen-256color
syntax enable          "구문 강조 사용
filetype indent on  "파일 종류에 따른 구문강조
colorscheme molokai
let g:rehash256 = 1

"========== NERDtree(plugin) ==========
let NERDTreeShowHidden=1
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <F5> :NERDTreeToggle<CR>
autocmd vimenter * NERDTreeFind | wincmd p	"vi 실행 시, NERDTree 실행, vi 에 cursor 위치(go to previous window)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"vi 종료 시, NERTTree도 종료

"========== syntastic(plugin) ==========
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"========== ctrlp(plugin) ==========
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_by_filename = 1
"let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_lazy_update = 1
let g:ctrlp_max_files = 0 "Set no max file limit
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"=====파일전환=====
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!0<CR>
map ,11 :b!11<CR>
map ,12 :b!12<CR>
map ,13 :b!13<CR>
map ,14 :b!14<CR>
map ,15 :b!15<CR>
map ,16 :b!16<CR>
map ,17 :b!17<CR>
map ,18 :b!18<CR>
map ,19 :b!19<CR>
map ,x :bn!<CR>
map ,z :bp!<CR>
map ,w :bw<CR>

"===== ctags =====
"set tags=$CTAGS_PATH/tags
set tags=/home/ryan.oh/workspace/bg4ct-m/tags

if version >= 500
func! Sts()
    let st = expand("<cword>")
    exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
    let st = expand("<cword>")
    exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>
endif

"========== tagbar ==========
set updatetime=500	"vim의 updatetime(tagbar 빠른 autoscroll 위해)
nnoremap <F6> :TagbarToggle<CR>
"let g:easytags_on_cursorhold
let g:easytags_autorecurse = 1
autocmd FileType c,cpp,h,java nested :call tagbar#autoopen()	"vi 실행 시, tagbar 실행 

"========== cscope ==========
set csprg=/usr/bin/cscope

"==================== Vundle ====================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'kien/ctrlp.vim'
	Plugin 'tomasr/molokai'
	Plugin 'majutsushi/tagbar'
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
