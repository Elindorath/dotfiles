syn on " Enable syntaxic colors
set number " Display line number
set mouse=a " Enable mouse support

set backspace=indent,eol,start " Fix delete key issue
set laststatus=2 " Always display the statusline in all windows
set t_Co=256 " Enable 256 colors mode
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
