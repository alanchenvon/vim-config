" Maintainer:
"     Alan Chen
" Last Update:
"     2021-05-30
"
let mapleader = "\<space>"

func! PluginConfig()
  " Specify a directory for plugins
  " - For Neovim: stdpath('data') . '/plugged'
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.config/vim/plugged')

  Plug 'junegunn/fzf', {'dir': '~/.config/vim/fzf/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  "Plug 'Yggdroot/LeaderF'

  " Code
  Plug 'scrooloose/nerdcommenter'
  Plug 'vim-scripts/indentpython.vim', {'for':'python'}
  Plug 'tell-k/vim-autopep8', {'for':'python'}

  " Lint
  Plug 'nvie/vim-flake8', {'for':'python'}

  " Expoler
  Plug 'scrooloose/nerdtree', {'on':['NERDTreeToggle','NERDTreeToggleVCS','NERDTreeFind','NERDTreeFouce']}
  Plug 'preservim/tagbar', {'on':['TagbarToggle']}

  " Syntax
  Plug 'rust-lang/rust.vim', {'for':'rust'}
  Plug 'justmao945/vim-clang', {'for':['c','cpp']}
  Plug 'vim-scripts/applescript.vim', {'for':'applescript'}
  Plug 'fatih/vim-go', {'tag': '*', 'for':'go'}
  Plug 'dgryski/vim-godef', {'for': 'go'}

  " Display
  Plug 'joshdick/onedark.vim'
  Plug 'ryanoasis/vim-devicons', {'on':['NERDTreeToggle','NERDTreeToggleVCS','NERDTreeFind','NERDTreeFouce']}
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ap/vim-css-color'
  Plug 'airblade/vim-gitgutter'

  " HTML
  Plug 'alvan/vim-closetag', {'for':['html','xml','jsp','php','vue']}

  " AutoComplete
"  Plug 'artur-shaik/vim-javacomplete2', {'for':'java'}
  "Plug 'ycm-core/YouCompleteMe', {'do':'./install.py', 'for':['vim','sh','bash','zsh','c','cpp','java','rust','go','js','python']}
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/vim/plugged/gocode/nvim/symlink.sh' }

  "Plug 'kiteco/vim-plugin'

  " Lint
  Plug 'neomake/neomake'

  " Switch IM
  Plug 'ybian/smartim'

  call plug#end()
endfunc
call PluginConfig()


"autocmd vimenter * call Start_Up()

func Start_Up()
  " Open NERDTree if filename is blank
  if ''==@%
    NERDTree | wincmd p
  end
endfunc

" Gernal
" -----------------------------------------------------
set nocompatible            " Disable Vi mode
filetype off                " Auto filetype
filetype plugin on          " Auto download filetype need plugin
set list
set confirm                 " Enable confirm in quit
set showmatch               " Show 相對應的括號
set showtabline=2           " 0: never, 1:great 2 tab, 2:always
set wildmenu                " Vim commandline auto complete
set signcolumn=yes
set smartcase               " Smart sensitive case


func! Basic_Syntax_Highlight_Config()
  colorscheme onedark

  syntax on                   " Enable syntax
  syntax sync maxlines=5      " Max line syntax number
  syntax sync minlines=5      " Min line syntax number
  set synmaxcol=200           " Mini column syntax number
  set cursorline              " 當前列位置標示
  "set cursorcolumn           " 當前欄位置標示

  " Default Colors for CursorLine
  highlight CursorLine ctermbg=54
  autocmd InsertEnter * highlight  CursorLine ctermbg=None
  autocmd InsertLeave * highlight  CursorLine ctermbg=54
endfunc
call Basic_Syntax_Highlight_Config()


func! Basic_Panel_Config()
  set title
  set ruler                   " Enable cursor now lineNumber
  set number                  " Enable Line number
  set splitright              " Split open in right
  set splitbelow              " Split open in bottom
  set noerrorbells            " Disable Vim err bells
  set showcmd                 " Enable Commandline tip
  set showmode                " Show 'INSERT' in CommandLine
  set cmdheight=2             " Set CommandLine height=2
  set linespace=0             " 行距設定為零
  set backspace=2             " Enable use Backspace
  set laststatus=2            " Vim statusLine Enable=2 Disable=1
  set lcs=tab:\|-,trail:-
  set iskeyword+=_,$,@,%,#,-  " 帶有下列符號的單字不要換行分割
endfunc
call Basic_Panel_Config()

func! Basic_Cursor_And_Move_Config()
  set mouse=a                 " Mouse Control Option
                              " a=all n=nomal v=visul i=insert c=cmdl
  set gcr=a:block-blinkon0    " Stop blink cursor
  set virtualedit=onemore     " Cursor可以移動當行最後一個字之後
  set scrolloff=10            " Cursor到達視窗最底保留行數
  set ww=h,l,b,s,<,>,[,]      " 游標可以左右移到前後行
                              " b  :   Backspace
                              " s  :   Space
                              " hl :   Left,Right
                              " <> :   n/v mode Left,Right
                              " [] :   i/r mode Left,Right
                              
  hi Visual  ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
endfunc
call Basic_Cursor_And_Move_Config()


func! Basic_Undo_History_Config()
  set undofile                " Enable undo 回滾文件記錄
  set history=200             " Max Vim history
  set undolevels=1000         " Max的改變回滾
  set undoreload=10000        " Max重載可回滾行數
  set undodir=~/.config/vim/.undodir
  set viminfo=%,<800,'10,/50,:100,h,f0,n~/.config/vim/.viminfo
  "           | |    |   |   |    | |  + viminfo file path
  "           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
  "           | |    |   |   |    + disable 'hlsearch' loading viminfo
  "           | |    |   |   + command-line history saved
  "           | |    |   + search history saved
  "           | |    + files marks saved
  "           | + lines saved each register (old name for <, vi6.2)
  "           + save/restore buffer list
endfunc
call Basic_Undo_History_Config()


func! Basic_Encoding_Config()
  set fileencoding=utf-8      " File encoding
  set fencs=utf-8
  set tenc=utf-8
  set fenc=utf-8
  set enc=utf-8
endfunc
call Basic_Encoding_Config()


func! Basic_Backup_Or_SWAP_Config()
  set noautowrite             " Disable Auto save
  set nobackup                " No Backup file
  set noswapfile
  set nowritebackup
endfunc
call Basic_Backup_Or_SWAP_Config()


func! Basic_Indent_Config()
  set nowrap                  " Auto wrap
  set fdc=4
  set tabstop=4               " Tab space stop
  set smarttab                " Smart tab
  set expandtab
  set cindent                 " Use C/C++ Indent Style
  set autoindent              " Auto Indent
  set smartindent             " Smart Indent
  set shiftwidth=4
  set softtabstop=4           " Backspace can delete indent
  set formatoptions=tcrqn     " Auto format
  set fdm=indent
endfunc
call Basic_Indent_Config()


func! Basic_Fold_Config()
  set foldmethod=marker       " Set foldmethod
  set foldlevel=0             " Set fold close in start
  set foldcolumn=0            " Set fold statusline width
endfunc
call Basic_Fold_Config()


func! Basic_Search_Config()
  set incsearch               " Search 時立刻顯示結果
  set hlsearch                " Highlight search result
  highlight Search cterm=none ctermbg=Yellow ctermfg=black
endfunc
call Basic_Search_Config()


func! Basic_Diff_Mode_Config()
  if &diff
    hi DiffAdd    ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
    hi DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
    hi DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
    hi DiffText   ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse
    " 設置diff相同文本的上下文行數為10
    set diffopt=context:10
  endif
endfunc
call Basic_Diff_Mode_Config()


func! Basic_FileType_Identify()
  autocmd BufRead,BufNewFile *.applescript  set filetype=applescript
  autocmd BufRead *.class  set filetype=java
endfunc
call Basic_FileType_Identify()


func! Basic_Insert_Leave_Switch_Input_Method_To_ABC()
  let g:smartim_default = 'com.apple.keylayout.ABC'
  func! SwitchToEnglish()
    echo 'Auto Switch Input Method To English.'
  endfunc
  autocmd InsertLeave * call SwitchToEnglish()
endfunc
call Basic_Insert_Leave_Switch_Input_Method_To_ABC()


let g:statusline_currentmode={
  \ 'n'      : 'N ',
  \ 'no'     : 'N·Operator Pending ',
  \ 'v'      : 'V ',
  \ 'V'      : 'V·Line ',
  \ '\<C-V>' : 'V·Block ',
  \ 's'      : 'Select ',
  \ 'S'      : 'S·Line ',
  \ '\<C-S>' : 'S·Block ',
  \ 'i'      : 'I ',
  \ 'R'      : 'R ',
  \ 'Rv'     : 'V·Replace ',
  \ 'c'      : 'Command ',
  \ 'cv'     : 'Vim Ex ',
  \ 'ce'     : 'Ex ',
  \ 'r'      : 'Prompt ',
  \ 'rm'     : 'More ',
  \ 'r?'     : 'Confirm ',
  \ '!'      : 'Shell ',
  \ 't'      : 'Terminal '
  \}


" Automatically change the statusline color depending on mode
func! Statusline_Color()
  let mode = mode()
  if (mode =~# '\v(n|no)')
    hi User1 ctermfg=black ctermbg=012
    set relativenumber
    return g:statusline_currentmode[mode]
  elseif (mode ==# 'i')
    hi User1 ctermfg=white ctermbg=red
    set norelativenumber
    return g:statusline_currentmode[mode]
  elseif (mode ==# 'R')
    hi User1 ctermfg=yellow ctermbg=005
    set norelativenumber
    return g:statusline_currentmode[mode]
  elseif (mode ==# 'c')
    hi User1 ctermfg=yellow ctermbg=005
    set relativenumber
    return g:statusline_currentmode[mode]
  elseif (mode =~# '\v(v|V)')
    hi User1 ctermfg=black ctermbg=yellow
    set relativenumber
    return g:statusline_currentmode[mode]
  else
    exe 'hi! StatusLine ctermfg=015 ctermbg=240'
    hi User1 ctermfg=white ctermbg=240
    return '? '
  endif
endfunc


" Find out current buffer's size and output it.
func! Statusline_File_Size()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif

  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction


func! Statusline_Read_Only()
  if &readonly || !&modifiable
    return 'ReadOnly'
  else
    return ''
endfunction


" Check column size. if over textwidth then warning
func! Statusline_Char_Count()
  let column = col('.')
  let textwidth = &textwidth
  if (column > textwidth)
    hi User3 ctermfg=015 ctermbg=009
  else
    hi User3 ctermfg=015 ctermbg=238
  endif
  return column
endfunc

func! Statusline_Config()
  set laststatus=2
  set statusline=
  set statusline+=%1*\ %{Statusline_Color()}
  set statusline+=%2*\ [%n]
  set statusline+=%2*\ %<%F\ %{Statusline_Read_Only()}\ %m\ %w\ 
  set statusline+=%#warningmsg#
  set statusline+=%2*
  set statusline+=%2*\ %=
  set statusline+=%2*\ %y\ 
  set statusline+=%2*\ %{(&fenc!=''?toupper(&fenc):toupper(&enc))}
  set statusline+=%2*\ %{toupper(&ff)}
  set statusline+=%2*\ %-3(%{Statusline_File_Size()}%)
  set statusline+=%2*\ %3p%%\ %l:
  set statusline+=%3*\ %3{Statusline_Char_Count()}

  " Current Mode
  hi User1 ctermfg=015 ctermbg=238
  hi User2 ctermfg=015 ctermbg=238
  hi User3 ctermfg=015 ctermbg=238
endfunc
call Statusline_Config()


func! Highlight_Extra_White_Space()
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
endfunc
call Highlight_Extra_White_Space()


func! Draw_Text_Width_Area()
  " Text width ruler highlight
  highlight ColorColumn ctermbg=234
  let &colorcolumn=&textwidth . ",".join(range(&textwidth,999),",")
endfunc


func! Code_Template_Config()
  autocmd BufNewFile *.sh   0r ~/.config/vim/template/config.sh
  autocmd BufNewFile *.java 0r ~/.config/vim/template/config.java
endfunc
call Code_Template_Config()


func! Code_Snip_Config()
  autocmd FileType python :iabbrev <buffer> iff if:<left>
  autocmd FileType vim    :iabbrev <buffer> func func! ()<left><left>
endfunc
call Code_Snip_Config()


func! Code_Format()
  exec "w"
  if &filetype == 'c' || &filetype == 'h'
    exec "!astyle --style=allman --suffix=none %"
  elseif &filetype r_S' || &filetype == 'hpp'
    exec "!astyle --style=allman --suffix=none %"
  elseif &filetype == 'perl'
    exec "!astyle --style=gnu --suffix=none %"
  elseif &filetype == 'py'|| &filetype == 'python'
    exec "!autopep8 --in-place --aggressive %"
  elseif &filetype == 'java'
    exec "!astyle --style=java --suffix=none %"
  elseif &filetype == 'jsp'
    exec "!astyle --style=gnu --suffix=none %"
  elseif &filetype == 'xml'
    exec "!astyle --style=gnu --suffix=none %"
  else
    exec "normal gg=G"
    return
  endif
endfunc


func! Code_Compile_Run()
  exec "w"
  echo &filetype
  if &filetype =='python'
    exec "!time python %"
  elseif &filetype == 'sh'
    exec "!time bash %"
  elseif &filetype =='java'
    "exec "!javac -cp lib/* %"
    exec "!javac %"
    exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'html'
    exec "!firefox % &"
  endif
endfunc


func! File_Type_Config()
  autocmd BufNewFile,BufRead *.* call FT_Plain_Text_Config()
  autocmd BufNewFile,BufRead .vimrc,*.vim call FT_Vimrc_Config()
  autocmd BufNewFile,BufRead *.py call FT_Python_Config()
  autocmd BufNewFile,BufRead *.js,*.html,*.css call FT_Front_Config()
  autocmd BufNewFile,BufRead *.c,*.h,*.cpp call FT_Clang_Config()
  autocmd BufNewFile,BufRead *.java call FT_Java_Config()
  autocmd BufRead *.class call FT_Java_Class_Config()
endfunc
call File_Type_Config()




func! FT_Vimrc_Config()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set textwidth=79
  "set colorcolumn=79
  "set colorcolumn+=100
  set expandtab
  set autoindent
  set fileformat=unix

  call Draw_Text_Width_Area()
  nmap <leader> : call PrintHelp()<CR>
  "Override
  func! PrintHelp()
    echo 'vimrc Help'
    echo 'space Help'
  endfunc
  " Auto Reload Vimrc
  autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endfunc


func! FT_Clang_Config()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set textwidth=79
  set colorcolumn=79
  set expandtab
  set autoindent
  set fileformat=unix

  call Draw_Text_Width_Area()
  nmap <leader> : call PrintHelp()<CR>
  "Override
  func! PrintHelp()
    echo 'Clang Help'
    echo 'space Help'
  endfunc

  "vim-clang
  "開啟對C11和C++11的支援
  let g:clang_c_options='-std=gnu11'
  let g:clang_cpp_options='-std=c++11 -stdlib=libc++'
  "關閉語法檢查
  let g:clang_check_syntax_auto=0
  "不要自動格式化程式碼
  let g:clang_format_auto=1
  "程式碼格式化風格選項依次有LLVM，Google，Chromium，Mozilla，WebKit
  let g:clang_format_style = 'LLVM'
  "使得vim-clang的補全與其他IDE一致
  let g:clang_cpp_completeopt='longest,menuone,preview'
endfunc


func! FT_Plain_Text_Config()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set textwidth=79
  set colorcolumn=79
  set expandtab
  set autoindent
  set fileformat=unix

  call Draw_Text_Width_Area()
  nmap <leader> : call PrintHelp()<CR>
  "Override
  func! PrintHelp()
    echo 'PlainText Help'
    echo 'space Help'
  endfunc

endfunc


func! FT_Front_Config()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set textwidth=79
  set colorcolumn=79
  set expandtab
  set autoindent
  set fileformat=unix

  call Draw_Text_Width_Area()
  nmap <leader> : call PrintHelp()<CR>
  "Override
  func! PrintHelp()
    echo 'Front Help'
  endfunc

endfunc


func! FT_Java_Class_Config()
  %!~/.config/vim/java_decompiler/get-class-from-jar.sh %
  "silent %!~/.config/vim/java_decompiler/get-class-from-jar.sh %
  set readonly
  set ft=java
  silent normal gg=G
  set nomodified
  set nonu
endfunc


func! FT_Java_Config()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set textwidth=79
  set colorcolumn=79
  set colorcolumn+=100
  set colorcolumn+=120
  set expandtab
  set autoindent
  set fileformat=unix

  call Draw_Text_Width_Area()
  nmap <leader> : call PrintHelp()<CR>
  "Override
  func! PrintHelp()
    echo 'Java Help'
  endfunc

  nmap <leader> : call PrintHelp()<CR>

"  setlocal omnifunc=javacomplete#Complete
"  set completefunc=javacomplete#CompleteParamsInf
"  inoremap <buffer> . .<C-X><C-O><C-P><DOWN>
"  let g:JavaComplete_MavenRepositoryDisable = 0
"  let g:JavaComplete_BaseDir = '~/.config/vim/java_complete_cache/'
"  let g:JavaComplete_GradleExecutable = 'gradle'
"  let g:JavaComplete_ImportSortType = 'packageName'
"  let g:JavaComplete_StaticImportsAtTop = 1
"  let g:JavaComplete_ImportOrder = ['java.', 'javax.', 'com.', 'org.', 'net.']
"  let g:JavaComplete_RegularClasses = ['java.lang.String', 'java.lang.Object']
"  let g:JavaComplete_CustomTemplateDirectory = '~/.config/vim/jc_templates'
"  let g:JavaComplete_AutoStartServer = 1
"  let g:JavaComplete_CompletionResultSort = 0
"  let g:JavaComplete_IgnoreErrorMsg = 0
"  let g:JavaComplete_CheckServerVersionAtStartup = 1
"  let g:JavaComplete_ExcludeClassRegex = 'lombok\(\.experimental\)\?\.var'
"  let g:JavaComplete_SourceExclude = ['src/frontend']
"
"  " Default Mapping
"  let g:JavaComplete_EnableDefaultMappings = 0
"  nmap <leader>im <Plug>(JavaComplete-Imports-AddMissing)
"  nmap <leader>ir <Plug>(JavaComplete-Imports-RemoveUnused)
"  nmap <leader>is <Plug>(JavaComplete-Imports-AddSmart)
"  nmap <leader>ia <Plug>(JavaComplete-Imports-Add)
"
"  nmap <leader>gam <Plug>(JavaComplete-Generate-AbstractMethods)
"  nmap <leader>gA <Plug>(JavaComplete-Generate-Accessors)
"  nmap <leader>gs <Plug>(JavaComplete-Generate-AccessorSetter)
"  nmap <leader>gg <Plug>(JavaComplete-Generate-AccessorGetter)
"  nmap <leader>ga <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"
"  nmap <leader>gts <Plug>(JavaComplete-Generate-ToString)
"  nmap <leader>geq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
"  nmap <leader>gc <Plug>(JavaComplete-Generate-Constructor)
"  nmap <leader>gdc <Plug>(JavaComplete-Generate-DefaultConstructor)
"
"  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
"  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

endfunc


func! FT_Python_Config()
  " Editor Format
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set textwidth=79
  set colorcolumn=79
  set expandtab
  set autoindent
  set fileformat=unix

  call Draw_Text_Width_Area()
  nmap <leader> : call PrintHelp()<CR>
  "Override
  func! PrintHelp()
    echo 'Python Help'
  endfunc

  "High light
  let python_highlight_all=1

    let g:autopep8_pep8_passes=100
    let g:autopep8_max_line_length=79
    let g:autopep8_indent_size=4
    let g:autopep8_disable_show_diff=1
    let g:autopep8_diff_type='horizontal'
    "let g:autopep8_diff_type='vertical'
    let g:autopep8_on_save = 1

    " Autopep8
    "autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
    nmap <buffer> <F8> :call Autopep8()<CR>

endfunc




func! Plugin_Tagbar_Config()
  let g:tagbar_position = 'botright vertical'
  let g:tagbar_sort = 0
  let g:tagbar_compact = 1
  let g:tagbar_help_visibility = 0
  let g:tagbar_indent = 1
  let g:tagbar_show_data_type = 1
  let g:tagbar_show_visibility = 1
  let g:tagbar_visibility_symbols = {
            \ 'public'    : '+',
            \ 'protected' : '#',
            \ 'private'   : '-'
            \ }
  let g:tagbar_show_linenumbers = 0
  "  0: Don't show any line numbers.
  "  1: Show absolute line numbers.
  "  2: Show relative line numbers.
  " -1: Use the global line number settings.
  let g:tagbar_show_tag_count = 1
  let g:tagbar_singleclick = 1
  let g:tagbar_iconchars = ['▶', '▼']
          let g:tagbar_scopestrs = {
            \    'class': "\uf0e8",
            \    'const': "\uf8ff",
            \    'constant': "\uf8ff",
            \    'enum': "\uf702",
            \    'field': "\uf30b",
            \    'func': "\uf794",
            \    'function': "\uf794",
            \    'getter': "\ufab6",
            \    'implementation': "\uf776",
            \    'interface': "\uf7fe",
            \    'map': "\ufb44",
            \    'member': "\uf02b",
            \    'method': "\uf6a6",
            \    'setter': "\uf7a9",
            \    'variable': "\uf71b",
            \ }
  let g:tagbar_autopreview = 0
  let g:tagbar_use_cache = 0
endfunc
call Plugin_Tagbar_Config()


func! Plugin_NERDTree_Config()
  let g:NERDTreeNotificationThreshold = 500
  let g:NERDTreeMouseMode=3  " optional: 單鍵點擊就可以打開資料夾/檔案
  let g:NERDTreeShowHidden=1
  let g:NERDTreeWinSize=30
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
endfunc
call Plugin_NERDTree_Config()


func! Plugin_NERDTree_SyntaxHighlight_Config()
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1

  " Custom file color
  let g:NERDTreeExtensionHighlightColor = {}
  let g:NERDTreeExtensionHighlightColor['vue'] = '42b883'


  " Plugin NERDCommenter
  let g:NERDCreateDefaultMappings = 1
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 0
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  let g:NERDCommentEmptyLines = 1
  let g:NERDTrimTrailingWhitespace = 1
endfunc
call Plugin_NERDTree_SyntaxHighlight_Config()


func! Plugin_Gitgutter_Config()
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '>'
  let g:gitgutter_sign_removed = '-'
  let g:gitgutter_sign_removed_first_line = '^'
  let g:gitgutter_sign_modified_removed = '<'
  let g:gitgutter_override_sign_column_highlight = 1
  set updatetime=100
  highlight SignColumn guibg=bg
  highlight SignColumn ctermbg=bg
endfunc
call Plugin_Gitgutter_Config()


func! Plugin_VimCloseTag_Config()
  let g:closetag_filenames='*.html,*.vue,*.php,*.jsp,*.xml'
endfunc
call Plugin_VimCloseTag_Config()

func! Plugin_Neomake_Config()
  funct! MyOnBattery()
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  endfun

  if MyOnBattery()
    call neomake#configure#automake('w')
  else
    call neomake#configure#automake('nw', 1000)
  endif
endfunc
call Plugin_Neomake_Config()

func! Plugin_Vim_Go_Config()
  let g:go_fmt_command = "goimports"
  let g:go_autodetect_gopath = 1
  let g:go_list_type = "quickfix"
  let g:go_version_warning = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_generate_tags = 1
  let g:godef_split=2
endfunc
call Plugin_Vim_Go_Config()


func! YCM_Config()
  " Enable debugging
  let g:ycm_keep_logfiles = 1
  let g:ycm_log_level = 'debug'
  ":YcmDebugInfo
  "--   jdt.ls Java Language Server running
  "--   jdt.ls Java Language Server Startup Status: Ready
  let g:ycm_global_ycm_extra_conf='~/.config/vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf=0

  let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
  let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

  let g:ycm_key_invoke_completion = '<C-Space>'

  let g:ycm_cache_omnifunc=0                   " 禁止緩存匹配項,每次都重新生成匹配項
  let g:ycm_seed_identifiers_with_syntax=1
  let g:ycm_min_num_of_chars_for_completion=1  "從第一個鍵入字元就開始羅列匹配項

  let g:ycm_complete_in_comments=0
  let g:ycm_complete_in_strings=0

  let g:ycm_collect_identifiers_from_comments_and_strings=0
  let g:ycm_collect_identifiers_from_tags_files=1

  let g:ycm_auto_trigger=1
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_autoclose_preview_window_after_insertion = 0
  let g:ycm_max_num_candidates = 10

  " 1: YCM will use clangd if clangd binary exists in third party or it was provided with ycm_clangd_binary_path option.
  " 0: YCM will never use clangd completer.
  let g:ycm_use_clangd = 1
  let g:ycm_clangd_binary_path = '/usr/bin/clang'


  set completeopt=menuone,longest,preview
  
  let g:ycm_filetype_blacklist = {
      \'tagbar': 1,
      \'notes': 1,
      \'markdown': 1,
      \'netrw': 1,
      \'unite': 1,
      \'text': 1,
      \'vimwiki': 1,
      \'pandoc': 1,
      \'infolog': 1,
      \'leaderf': 1,
      \'mail': 1
      \}

  let g:ycm_filetype_specific_completion_to_disable = {
      \'gitcommit': 1
      \}


  "設定YCM語意補全自動觸發條件
  let g:ycm_semantic_triggers =  {
    \   'c': ['->', '.'],
    \   'objc':['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \             're!\[.*\]\s'],
    \   'ocaml':['.', '#'],
    \   'cpp,objcpp':['->', '.', '::'],
    \   'perl':['->'],
    \   'php':['->', '::'],
    \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go':['.'],
    \   'ruby':['.', '::'],
    \   'lua':['.', ':'],
    \   'erlang':[':'],
    \ }
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif	"離開插入模式後自動關閉預覽窗口




  "function! s:CustomizeYcmLocationWindow()
    "" Move the window to the top of the screen.
    "wincmd K
    "" Set the window height to 5.
    "5wincmd _
    "" Switch back to working window.
    "wincmd p
  "endfunction
"
  "autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

endfunc
"call YCM_Config()

" YCM Subcommands:
" GoTo Commands J:
"   GoToInclude
nmap <leader>jc :YcmCompleter GoToDeclaration<CR>
nmap <leader>jd :YcmCompleter GoToDefinition<CR>
"   GoTo
"   GoToImprecise
"   GoToSymbol <symbol query>
nmap <leader>jr :YcmCompleter GoToReferences<CR>
nmap <leader>ji :YcmCompleter GoToImplementation<CR>
"   GoToImplementationElseDeclaration
nmap <leader>jt :YcmCompleter GoToType<CR>
"   GoToDocumentOutline
nmap <leader>gt :YcmCompleter GetType<CR>
"   GetTypeImprecise
"   GetParent
nmap <leader>gd :YcmCompleter GetDoc<CR>
"   GetDocImprecise
" Refactoring Commands R:
"   FixIt
"   RefactorRename <new name>
"   Format
nmap <leader>roi :YcmCompleter OrganizeImports<CR>
" Miscellaneous Commands:
"   ExecuteCommand <args>
"   RestartServer
"   ReloadSolution
" Functions:
"   call youcompleteme#GetErrorCount()
"   call youcompleteme#GetWarningCount()
" Autocommands:
"   YcmLocationOpened
"   
"

let g:custom_ycm_not_run_list = ['nerdtree', 'tagbar', 'netrw']

if index(g:custom_ycm_not_run_list, &filetype) >= 0
  "echo 'is not file.'
else
  "echo 'is file.'
endif


func! Key_Mapping_Config()
  nmap <leader><UP> 10<C-W>+
  nmap <leader><DOWN> 10<C-W>-
  nmap <leader><LEFT> 10<C-W>>
  nmap <leader><RIGHT> 10<C-W><
  nmap <C-l> :call Code_Format()<CR>
  nmap <C-_> <Plug>NERDCommenterToggle<CR>
  vmap <C-_> <Plug>NERDCommenterToggle<CR>
  nmap <F1> :NERDTreeToggleVCS<CR>
  nmap <F2> :TagbarToggle<CR>
  "nmap <F3> :TagbarToggle<CR>
  nmap <F4> :call Code_Compile_Run()<CR>
  "nmap <F5> :TagbarToggle<CR>
  "nmap <F6> :TagbarToggle<CR>
  "nmap <F7> :TagbarToggle<CR>
  "nmap <F8> :TagbarToggle<CR>
  "nmap <F9> :TagbarToggle<CR>
  "nmap <F10> :TagbarToggle<CR>

  " Gitgutter
  nmap <Leader>gn <Plug>GitGutterNextHunk
  nmap <Leader>gp <Plug>GitGutterPrevHunk
  nmap <Leader>gs <Plug>GitGutterPreviewHunk
  nmap <Leader>ga <Plug>GitGutterStageHunk
  nmap <Leader>gu <Plug>GitGutterUndoHunk

  " FZF
  nmap <C-p> :Files<CR>
endfunc
call Key_Mapping_Config()
