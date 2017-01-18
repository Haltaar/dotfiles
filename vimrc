" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
"------------------------------------------------------------
" Vim color scheme
"
" Name:        nucolors.vim
" Maintainer:  Christian Brassat <crshd@mail.com>
" License:     public domain
"
" Based on a port of the RailsCasts TextMate theme [1] to Vim.
" Some parts of this theme were borrowed from the well-documented Lucius theme [2].
" 
" [1] http://railscasts.com/about 
" [2] http://www.vim.org/scripts/script.php?script_id=2536

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nucolors"

" Colors
" Brown        #FFFFB9
" Dark Blue    #7DC1CF
" Dark Green   #B8D68F
" Dark Orange  #E1AA5D
" Light Blue   #4E9FB1
" Light Green  #A0CF5D
" Tan          #F39D21
" Red          #E84F4F
"
hi Nontext                   guifg=#404040
hi Normal                    guifg=#E6E1DC guibg=#151515
hi Cursor                    guibg=#FF8939
hi CursorLine                guibg=#202020
hi LineNr                    guifg=#665544 guibg=#101010
hi Search                    guibg=#5A647E
hi VertSplit                 guifg=#1b1b1b guibg=#1b1b1b
hi Visual                    guibg=#5A647E

" Folds
" line used for closed folds
hi Folded                    guifg=#5A647E guibg=#202020 
hi FoldColumn                guifg=#505050 guibg=#050505

" Misc
" ----
" directory names and other special names in listings
hi Directory                 guifg=#A0CF5D 

" Popup Menu
" ----------
" normal item in popup
hi Pmenu                     guifg=#F6F3E8 guibg=#444444 
" selected item in popup
hi PmenuSel                  guifg=#000000 guibg=#A0CF5D 
" scrollbar in popup
hi PMenuSbar                 guibg=#5A647E 
" thumb of the scrollbar in the popup
hi PMenuThumb                guibg=#AAAAAA 


"rubyComment
hi Comment                   guifg=#809080 
hi Todo                      guifg=#809080 guibg=NONE 

"Invisibles
hi NonText                   guifg=#665544
hi SpecialKey                guifg=#665544

"rubyPseudoVariable
"nil, self, symbols, etc
hi Constant                  guifg=#7DC1CF

"rubyClass, rubyModule, rubyDefine
"def, end, include, etc
hi Define                    guifg=#FFFFB9 gui=bold

"rubyInterpolation
hi Delimiter                 guifg=#B8D68F

"rubyError, rubyInvalidVariable
hi Error                     guifg=#FFFFFF guibg=#990000

"rubyFunction
hi Function                  guifg=#E84F4F gui=bold 

"rubyIdentifier
"@var, @@var, $var, etc
hi Identifier                guifg=#4E9FB1 

"rubyInclude
"include, autoload, extend, load, require
hi Include                   guifg=#E1AA5D gui=bold 

"rubyKeyword, rubyKeywordAsMethod
"alias, undef, super, yield, callcc, caller, lambda, proc
hi Keyword                   guifg=#E1AA5D

" same as define
hi Macro                     guifg=#E1AA5D 

"rubyInteger
hi Number                    guifg=#A0CF5D

" #if, #else, #endif
hi PreCondit                 guifg=#E1AA5D 

" generic preprocessor
hi PreProc                   guifg=#E1AA5D 

"rubyControl, rubyAccess, rubyEval
"case, begin, do, for, if unless, while, until else, etc.
hi Statement                 guifg=#E1AA5D 

"rubyString
hi String                    guifg=#A0CF5D

hi Title                     guifg=#FFFFFF

"rubyConstant
hi Type                      guifg=#E84F4F 

hi DiffAdd                   guifg=#E6E1DC guibg=#144212
hi DiffDelete                guifg=#E6E1DC guibg=#660000

hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag

hi xmlTag                    guifg=#E8BF6A
hi xmlTagName                guifg=#E8BF6A
hi xmlEndTag                 guifg=#E8BF6A

" Status line - changes colors depending on insert mode
" Standard
hi User1          guifg=#E8BF6A   guibg=#202020   gui=bold
hi User2          guifg=#E84F4F   guibg=#202020   gui=bold
hi User3          guifg=#A0CF5D   guibg=#202020   gui=bold
hi User4          guifg=#202020   guibg=#E8BF6A   gui=bold
hi User5          guifg=#909090   guibg=#202020   
hi User6          guifg=#40352D   guibg=#202020   
hi User7          guifg=#202020   guibg=#202020   gui=bold
hi StatusLine     guifg=#E6E1DC   guibg=#202020   gui=bold
hi StatusLineNC   guifg=#606060   guibg=#202020   gui=bold

function! InsertStatuslineColor(mode)

  if a:mode == 'i' " Insert Mode
    hi User4      guifg=#202020   guibg=#7DC1CF

  elseif a:mode == 'r' " Replace Mode
    hi User4      guifg=#202020   guibg=#E84F4F

  else
    hi User4      guifg=#202020   guibg=#E8BF6A

  endif
endfunction

" Call function
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guifg=#E6E1DC   guibg=#202020
au InsertLeave * hi User4      guifg=#202020   guibg=#E8BF6A

