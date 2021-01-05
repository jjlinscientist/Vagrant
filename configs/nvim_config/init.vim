for file in split(glob('$HOME/.config/nvim/vimrc.d/*.vimrc'), '\n')
    exe 'source' file
endfor
