""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
    " plus some keyboard mappings that I've found useful.
    "
    " USAGE: 
    " -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
    "               'plugin' directory in some other directory that is in your
    "               'runtimepath'.
    "
    " -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
    "               your ~/.vimrc file (or cut and paste it into your .vimrc).
    "
    " NOTE: 
    " These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
    " keeps timing you out before you can complete them, try changing your timeout
    " settings, as explained below.
    "
    " Happy cscoping,
    "
    " Jason Duell       jduell@alumni.princeton.edu     2002/3/7
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


    " This tests to see if vim was configured with the '--enable-cscope' option
    " when it was compiled.  If it wasn't, time to recompile vim... 
    if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
    	cs add cscope.out  
	"elseif $CSCOPE_DB != ""
	"cs add $CSCOPE_DB
	endif

    " show msg when any other cscope db added
    set cscopeverbose  

    nmap ,cs :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap ,cg :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap ,cc :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap ,ct :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap ,ce :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap ,cf :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap ,ci :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
    nmap ,cd :cs find d <C-R>=expand("<cword>")<CR><CR>	

    nmap .cs :tabnew<Bar> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap .cg :tabnew<Bar> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap .cc :tabnew<Bar> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap .ct :tabnew<Bar> :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap .ce :tabnew<Bar> :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap .cf :tabnew<Bar> :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap .ci :tabnew<Bar> :cs find i <C-R>=expand("<cfile>")<CR>$<CR>	
    nmap .cd :tabnew<Bar> :cs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>	


"   nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
"   nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
"   nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
"   nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
"   nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
"   nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
"   nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
"   nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

"   nmap <C-@>s :tabnew<Bar> :cs find s <C-R>=expand("<cword>")<CR><CR>
"   nmap <C-@>g :tabnew<Bar> :cs find g <C-R>=expand("<cword>")<CR><CR>
"   nmap <C-@>c :tabnew<Bar> :cs find c <C-R>=expand("<cword>")<CR><CR>

"   nmap <C-@>t :tabnew<Bar> :cs find t <C-R>=expand("<cword>")<CR><CR>
"   nmap <C-@>e :tabnew<Bar> :cs find e <C-R>=expand("<cword>")<CR><CR>
"   nmap <C-@>f :tabnew<Bar> :cs find f <C-R>=expand("<cfile>")<CR><CR>	
"   nmap <C-@>i :tabnew<Bar> :cs find i <C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-@>d :tabnew<Bar> :cs find d <C-R>=expand("<cword>")<CR><CR>

"    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>	

	set timeoutlen=3000
    endif
