# vimfiles

I use Vim daily. I made my own configuration. And here it is!

## Prerequisites

### Neovim

This configuration assumes that you are using Neovim. You can install this using
Homebrew:

    brew install neovim/neovim/neovim

If you are using my [dotfiles][dotfiles] then you can move on to the next step,
as I've set up both `vim` and `vi` to open Neovim. Otherwise, you'll need to add
them yourself. Configure your shell to add the following aliases:

    alias v="neovim"
    alias vi="neovim"
    alias vim="neovim"

Now you can simply say `v` to start Neovim (or, if you don't like that, you can
still use `vi` or `vim`).

### iTerm / Terminal

You'll also want to make sure your terminal is using a Powerline-compatible
font, that is, a font that's patched to support Powerline characters (such as
arrows and icons and things). There's a list of fonts you can choose from
[here][powerline-fonts]. Whichever one you download, drop it in
`~/Library/Fonts` and you can use it right away. **NOTE: If you are using iTerm,
make sure that the "non-ASCII" font is also set to the same Powerline font as
the "normal" font, otherwise you'll get strange "X" characters in place of the
Powerline characters.**

## Installation

First, clone this repo somewhere. I recommend placing it in the same place that
you usually store code because you may want to come back to it later and make
modifications. If you do plan on making modifications, I recommend forking this
repo first.

Next, run the install script:

    script/install

By default this will copy the files to your home directory, but if you've
forked this repo and plan on developing it further, then you may want to create
symlinks instead:

    script/install --link

If you want to know what this will do first, say:

    script/install --dry-run

For further help, say:

    script/install --help

## Post install

Once all files are in place, run

    git submodule update --init

This will install NeoBundle which is necessary for installing the other Vim
plugins.

Finally, open Vim and run

    :NeoBundleInstall

You shouldn't have any problems doing this, but if you do, please [create an
issue][issues].

## What's inside

Here's a rundown of (almost) everything my configuration does:

### Basics

* Use NeoBundle to manage plugins
* Show line numbers
* Show line/column in status bar
* Hide buffers when they are not displayed (vs. unloading them)
* Remove delay after pressing Escape and clearing the visual selection
* Use modelines and check 10 lines to read them
* Fix so typing '#' (which is a comment in CoffeeScript, and elsewhere) does not
  jump to the start of the line
* Enable per-directory .vimrc's

### Magic

* Auto-reload files that are modified outside of Vim
* Auto-source vim config when it's modified
* Remember the last location in an file when reopening it

### Colors

* Enable 256-color support
* Use mokolai color scheme (customized by yours truly)
* Set four color columns at 72, 80, 100, and 120 characters

### Whitespace

* Set tabstop to 2 spaces always; use tabs by default, but use spaces for
  file formats I personally use (Ruby, CSS, JavaScript, CoffeeScript, HTML, XML,
  Markdown, Haml, Shell, ERB, Sass, Vimscript, Stylus, Jade)
* Display invisible characters: tabs, spaces, and end-of-line
* Highlight trailing whitespace, but provide a way to trim whitespace manually
  (`<Leader>tw`)
* Change the color of leading tabs to a dark color so it's not so overwhelming

### Line wrapping

* Soft wrap lines
* For wrapped lines, `j` and `k` jump to the next row rather than the next
  actual line
* Don't insert two spaces, but one space, after joining lines
* Turn on most of the `formatoptions`:
  * Auto-wrap text
  * Auto-wrap comments
  * Auto-insert comment leader
  * Allow formatting of comments using `gq`
  * In insert mode, auto-soft wrap only if the line was less than the wrap
    length before you entered insert mode (otherwise you can use `Q` to wrap)
* `<Leader>ww` toggles hard wrapping (which is on by default)
* `<Leader>wi` toggles soft wrapping (which is off by default)

### Searching

* Show all matches when you search (use `Ctrl-\` to clear)
* Enable incremental search (when using `/` to search)

### Filetype-based configuration

* Ensure config.ru, Gemfile, Rakefile, Thorfile, Vagrantfile, Appraisals, and
  Bowerfile are all syntax-highlighted as Ruby files
* Ensure Haml Coffee files are highlighted as Haml files
* Ensure JSON and *.jshintc files are highlighed as JavaScript files
* Make Python files follow PEP8

### Folding

* Enable folding
* Folding works according to indentation, and the max indentation level is 6

### Window

* New splits go below the current buffer, and also to the right

### Scrolling

* Always show at least 3 lines above/below cursor and at least 7 columns next to
  the cursor even when scrolling

### Cursor

* Use a line for the cursor (instead of a block) when entering insert mode under
  iTerm2, and also make sure this appears under tmux too

### Various mappings

* Map `%` to bounce from `do` to `end` in Ruby files
* Map `<Leader>evb` to open ~/.vimrc.bundles
* Map `F3` to easily toggle paste mode
* Map `Ctrl-{h,l,k,j}` to move between windows (left, right, up, down)
* Map `Q` to re-format the selection
* Map `Y` to yank to the end of the line (like `C` and `D`)
* No-op `K` as it doesn't do anything useful
* Map `Ctrl-S` to save, `Ctrl-Q` to save + quit
* Map `Ctrl-\` to clear the current highlight (no more typing `/asdf` or
  somesuch)
* Map `<Leader>tc` to close a tab
* Map `<Leader>po` to open a new line and paste into it
* Map `<Leader>pc` to paste overwriting the current line

### Plugins

#### NERDTree

* Open NERDTree as soon as you start Vim (I don't like that annoying splash
  screen)
* Map `<Leader>tt` to toggle the NERD tree
* Map `<Leader>tf` to open the NERD tree and then reveal the current file
* Close vim if the only window left open is a NERD tree

#### Ctrl-P

* Open at the top instead of the bottom
* Use Ag for searching so it's faster

#### FormatComment

* Map `<Leader>qc` to use the FormatComment plugin to format comments. (This may
  or may not work better than `<Leader>gqc`.)

#### IndentLines

* Use `¦` to show indentation levels. (This is more handy than you realize.)
* Set this token to a dark color so it isn't that noticeable

#### vim-coffee-script

* Don't highlight objects, brackets, curly braces, parentheses, or operators

#### Airline

* Show the Airline for all windows not just split windows
* Use Powerline symbols
* Tell vim to not show `-- INSERT --` in the status bar, as Airline already
  shows its own version of which mode you're in

#### splitjoin

* When splitting a line in Ruby that looks like `foo :x => 'y'`, don't
  add curly braces. (At least I think this is what this does)

#### vim-session

* Save the current session every 10 minutes
* When opening vim, open the current session if one has been saved
* Map `<Leader>ss` as a shortcut for `:SaveSession`
* Map `<Leader>so` as a shortcut for `:OpenSession`

#### vim-flavored-markdown

* Ensure that *.md and *.markdown files are highlighted as GitHub-flavored
  Markdown files and not regular Markdown files.

#### vim-slim

* Turn off smart indenting (I forget why now but it screws something up)

### Plugins

These are the plugins that I use on a regular basis, in rough order of
importance:

#### Essentials

* [NeoBundle][vim-neobundle]
* [NERDTree][vim-nerdtree]
* [Ctrl-P][vim-ctrl-p]
* [Ag][vim-ag]
* [Airline][vim-airline]
* [SuperTab][vim-supertab]
* [vim-git][vim-git]
* [ragtag][vim-ragtag]
* [surround][vim-surround]

#### Not-so-essentials but still useful

* [Syntastic][vim-syntastic]
* [vim-textobj-rubyblock][vim-textobj-rubyblock]
* [indentLine][vim-indentline]
* [NERDCommenter][vim-nerdcommenter]
* [vim-session][vim-session]
* [ZoomWin][vim-zoomwin]

#### Syntax plugins

* [CoffeeScript][vim-coffeescript]
* [GitHub-flavored Markdown][vim-flavored-markdown]
* [HTML5][vim-html5-syntax]
* [Haml][vim-haml]
* [Jade][vim-jade]
* [JavaScript][vim-javascript]
* [Mustache][vim-mustache]
* [Ruby][vim-ruby]
* [Sass][vim-scss-syntax]
* [Sinatra][vim-ruby-sinatra]
* [Slim][vim-slim]
* [Stylus][vim-stylus]
* [YAML][vim-yaml]

## Author

Elliot Winkler (<elliot.winkler@gmail.com>)

[vim-neobundle]: http://github.com/Shougo/NeoBundle
[vim-nerdtree]: http://github.com/scrooloose/nerdtree
[vim-ctrl-p]: http://github.com/kien/ctrlp.vim
[vim-ag]: http://github.com/rking/ag.vim'
[vim-airline]: http://github.com/bling/vim-airline
[vim-supertab]: http://github.com/ervandew/supertab
[vim-git]: http://github.com/tpope/vim-git
[vim-ragtag]: http://github.com/tpope/vim-ragtag
[vim-syntastic]: http://github.com/scrooloose/syntastic
[vim-surround]: http://github.com/tpope/vim-surround
[vim-textobj-rubyblock]: http://github.com/nelstrom/vim-textobj-rubyblock
[vim-indentline]: http://github.com/Yggdroot/indentLine
[vim-nerdcommenter]: http://github.com/scrooloose/nerdcommenter
[vim-session]: http://github.com/xolox/vim-session
[vim-zoomwin]: http://github.com/vim-scripts/ZoomWin
[vim-ruby]: http://github.com/mcmire/vim-ruby
[vim-coffeescript]: http://github.com/kchmck/vim-coffee-script
[vim-flavored-markdown]: http://github.com/jtratner/vim-flavored-markdown
[vim-html5-syntax]: http://github.com/othree/html5-syntax.vim
[vim-haml]: http://github.com/tpope/vim-haml
[vim-jade]: http://github.com/digitaltoad/vim-jade
[vim-javascript]: http://github.com/pangloss/vim-javascript
[vim-mustache]: http://github.com/juvenn/mustache.vim
[vim-ruby]: http://github.com/mcmire/vim-ruby
[vim-scss-syntax]: http://github.com/cakebaker/scss-syntax.vim
[vim-ruby-sinatra]: http://github.com/hallison/vim-ruby-sinatra
[vim-slim]: http://github.com/djbender/vim-slim
[vim-stylus]: http://github.com/wavded/vim-stylus
[vim-yaml]: http://github.com/avakhov/vim-yaml
[issues]: http://github.com/mcmire/vimfiles/issues
[dotfiles]: http://github.com/mcmire/dotfiles
[powerline-fonts]: https://github.com/Lokaltog/powerline-fonts
