# light-show.vim

Light presentations on Neovim/Vim using [Goyo](https://github.com/junegunn/goyo.vim).

**Warning**: Still on development state.

## Requirements

- [Goyo](https://github.com/junegunn/goyo.vim)

## Installation

Install using [vim-plug](https://github.com/junegunn/vim-plug).
Put this on your `init.vim` or `.vimrc` file.

```vim
Plug 'junegunn/goyo.vim'

Plug 'stsewd/light-show.vim'
```

## Usage

- Enter to _presentation mode_ with `:StartPresentation` or with `<Enter>`
- Press `n` to go to the next slide
- Press `p` to go to the previous slide
- Exit presentation mode with `<Backspace>`

## Tips

### Edition

- `:center`
- `set virtuledit=all`

# Export to html

- `:TOhtml`
