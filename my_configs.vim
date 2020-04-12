" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim_runtime/autoload/plug.vim'))
	silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set basic paraments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {

"{
  let         my_vimrc_path='~/.vim_runtime/my_configs.vim'
  command!    Myvimrc exe 'e '.my_vimrc_path 
"}

  colorsche   gruvbox
  set         nu
  set         relativenumber
  set         nospell
  syntax      on
  set         foldenable
  set         foldlevel=1
  "set        foldclose=all
  set         foldmethod=indent

" }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    
" => Set basic function    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
 
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

func! CompileClean()
	exec "w"
	if &filetype == 'tex'
		silent! exec "VimtexStop"
		exec "VimtexClean"
	endif
endfunc
 
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set general map keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
 
 " edit my vimrc
 map <silent> <leader>mv :exe 'e '.my_vimrc_path<cr>

 " let mapleader=""
 nmap <silent>[b :bprevious<CR>
 nmap <silent>]b :bnext<CR>
 " Alt+]: Open the definition in a vertical split
 " nmap <A-]>       :vsp <CR>:exec("GoDef ".expand("<cword>"))<CR>
 map <leader>tt : tabnext<CR>
 map <leader>sp : sp<CR>
 map <leader>vs : vs<CR>
 nmap Q         : q<CR>
 nmap S         : wq!<CR>

 " Compile function
 noremap \ll : call CompileRunGcc()<CR>
 noremap \lc : call CompileClean()<CR>

" }

 
"""""""""""""""""""""""""""""""
" => Load plugin set
""""""""""""""""""""""""""""""
" vim-plugin
 call plug#begin('~/.vim/bundle/')
 
 Plug 'godlygeek/tabular'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'tpope/vim-fugitive'
 Plug 'lervag/vimtex'
 Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

 call plug#end()

" {

" Latex
 if isdirectory(expand("~/.vim/bundle/vimtex"))
     let g:tex_flavor = "latex"
     let g:vimtex_quickfix_open_on_warning = 0
     let g:vimtex_quickfix_mode = 2
     if has('nvim')
         let g:vimtex_compiler_progname = 'nvr'
     endif
     let g:vimtex_view_method = 'zathura'
     let g:vimtex_view_general_viewer = 'zathura'
     let g:vimtex_mappings_enabled = 0
     let g:vimtex_text_obj_enabled = 0
     let g:vimtex_motion_enabled = 0
     " latex preview
     if isdirectory(expand("~/.vim/bundle/vim-latex-live-preview"))
         let g:livepreview_engine = 'xelatex'
         let g:livepreview_previewer = 'zathura'
         let g:livepreview_cursorhold_recompile = 0
     endif
 endif

" NerdTree
 let NERDTreeWinPos                        = 'left'
 let NERDTreeShowHidden                    = 1
 let nerdtree_tabs_open_on_gui_startup     = 0
 let nerdtree_tabs_open_on_console_startup = 0
 let NERDTreeWinSize                       = 28"

" Tabularize 
 if isdirectory(expand("~/.vim/bundle/tabular"))
     nmap <Leader>as  :Tabularize / /<CR>
     vmap <Leader>as  :Tabularize / /<CR>
     nmap <Leader>a&  :Tabularize /&<CR>
     vmap <Leader>a&  :Tabularize /&<CR>
     nmap <Leader>a=  :Tabularize /^[^=]*\zs=<CR>
     vmap <Leader>a=  :Tabularize /^[^=]*\zs=<CR>
     nmap <Leader>a=> :Tabularize /=><CR>
     vmap <Leader>a=> :Tabularize /=><CR>
     nmap <Leader>a: :Tabularize /:<CR>
     vmap <Leader>a: :Tabularize /:<CR>
     nmap <Leader>a:: :Tabularize /:\zs<CR>
     vmap <Leader>a:: :Tabularize /:\zs<CR>
     nmap <Leader>a, :Tabularize /,<CR>
     vmap <Leader>a, :Tabularize /,<CR>
     nmap <Leader>a,, :Tabularize /,\zs<CR>
     vmap <Leader>a,, :Tabularize /,\zs<CR>
     nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
     vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
 endif

" coc nvim
 if isdirectory(expand("~/.vim/bundle/coc.nvim"))
     " if hidden is not set, TextEdit might fail.
     set hidden
     " Some servers have issues with backup files, see #649
     set nobackup
     set nowritebackup
     " Better display for messages
     set cmdheight=2
     " You will have bad experience for diagnostic messages when it's default 4000.
     set updatetime=300
     " don't give |ins-completion-menu| messages.
     set shortmess+=c
     " always show signcolumns
     set signcolumn=yes
     " Use tab for trigger completion with characters ahead and navigate.
     " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
     inoremap <silent><expr> <TAB>
           \ pumvisible() ? "\<C-n>" :
           \ <SID>check_back_space() ? "\<TAB>" :
           \ coc#refresh()
     inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
     function! s:check_back_space() abort
       let col = col('.') - 1
       return !col || getline('.')[col - 1]  =~# '\s'
     endfunction
     " Use <c-space> to trigger completion.
     inoremap <silent><expr> <c-space> coc#refresh()
     " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
     " Coc only does snippet and additional edit on confirm.
     inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
     " Or use `complete_info` if your vim support it, like:
     " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
     nmap <silent> [g <Plug>(coc-diagnostic-prev)
     nmap <silent> ]g <Plug>(coc-diagnostic-next)
     " Remap keys for gotos
     nmap <silent> gd <Plug>(coc-definition)
     nmap <silent> gy <Plug>(coc-type-definition)
     nmap <silent> gi <Plug>(coc-implementation)
     nmap <silent> gr <Plug>(coc-references)
     " Use K to show documentation in preview window
     nnoremap <silent> K :call <SID>show_documentation()<CR>
     function! s:show_documentation()
       if (index(['vim','help'], &filetype) >= 0)
         execute 'h '.expand('<cword>')
       else
         call CocAction('doHover')
       endif
     endfunction
     
     " Highlight symbol under cursor on CursorHold
     autocmd CursorHold * silent call CocActionAsync('highlight')
     
     " Remap for rename current word
     nmap <leader>rn <Plug>(coc-rename)
     
     " Remap for format selected region
     xmap <leader>f  <Plug>(coc-format-selected)
     nmap <leader>f  <Plug>(coc-format-selected)
     
     augroup mygroup
       autocmd!
       " Setup formatexpr specified filetype(s).
       autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
       " Update signature help on jump placeholder
       autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
     augroup end
     
     " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
     xmap <leader>a  <Plug>(coc-codeaction-selected)
     nmap <leader>a  <Plug>(coc-codeaction-selected)
     
     " Remap for do codeAction of current line
     nmap <leader>ac  <Plug>(coc-codeaction)
     " Fix autofix problem of current line
     nmap <leader>qf  <Plug>(coc-fix-current)
     
     " Create mappings for function text object, requires document symbols feature of languageserver.
     xmap if <Plug>(coc-funcobj-i)
     xmap af <Plug>(coc-funcobj-a)
     omap if <Plug>(coc-funcobj-i)
     omap af <Plug>(coc-funcobj-a)
     
     " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
     nmap <silent> <TAB> <Plug>(coc-range-select)
     xmap <silent> <TAB> <Plug>(coc-range-select)
     
     " Use `:Format` to format current buffer
     command! -nargs=0 Format :call CocAction('format')
     
     " Use `:Fold` to fold current buffer
     command! -nargs=? Fold :call     CocAction('fold', <f-args>)
     
     " use `:OR` for organize import of current buffer
     command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
     
     " Add status line support, for integration with other plugin, checkout `:h coc-status`
     set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
     
     " Using CocList
     " Show all diagnostics
     nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
     " Manage extensions
     nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
     " Show commands
     nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
     " Find symbol of current document
     nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
     " Search workspace symbols
     nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
     " Do default action for next item.
     nnoremap <silent> <space>j  :<C-u>CocNext<CR>
     " Do default action for previous item.
     nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
     " Resume latest coc list
     nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
 endif

" Fugitive
 if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
     nnoremap <silent> <leader>gs   :Gstatus<CR>
     nnoremap <silent> <leader>gd   :Gdiff<CR>
     nnoremap <silent> <leader>gc   :Gcommit<CR>
     nnoremap <silent> <leader>gb   :Gblame<CR>
     nnoremap <silent> <leader>gl   :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'<CR>
     nnoremap <silent> <leader>glgg :Git log --graph<CR>
     nnoremap <silent> <leader>gp   :Git push<CR>
     nnoremap <silent> <leader>gr   :Gread<CR>
     nnoremap <silent> <leader>gw   :Gwrite<CR>
     nnoremap <silent> <leader>ge   :Gedit<CR>
     " Mnemonic _i_nteractive
     nnoremap <silent> <leader>gi :Git add -p %<CR>
     nnoremap <silent> <leader>gg :SignifyToggle<CR>
 endif


" }
