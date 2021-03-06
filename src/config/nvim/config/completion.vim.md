*(← Back to [index](../README.md))*

# Completion settings

This file controls how completion works. In Vim there are two places where
you can complete words: [Insert mode][ins-completion] and [Ex
mode][cmdline-completion].

[ins-completion]: http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion
[cmdline-completion]: http://vimdoc.sourceforge.net/htmldoc/cmdline.html#cmdline-completion

We'll start with Insert-mode completion. [SuperTab] lets us use <kbd>Tab</kbd>
to trigger this. The [`wildmode`][wildmode] option controls what happens when
you press Tab multiple times when there are multiple matches for the string
you've typed. Here we specify that as long as <kbd>Tab</kbd> is pressed, an
autocomplete menu should be shown, but that different things should happen the
first time versus subsequent times. The first time, the string typed will be
compared to the available matches, and the match chosen for autocompletion will
be the longest subsequence of the string typed. After that, the match chosen for
autocompletion will be the first one in the list.

[wildmode]: http://vimdoc.sourceforge.net/htmldoc/options.html#'wildmode'
[SuperTab]: http://github.com/ervandew/supertab

``` vim
set wildmode=list:longest,list:full
```

The [`wildignore`][wildignore] option controls the behavior of filename
completion when entering commands in Ex mode. File paths that match the
following patterns will not be completed:

[wildignore]: http://vimdoc.sourceforge.net/htmldoc/options.html#'wildignore'

``` vim
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,bundle/**,vendor/gems/*,vendor/ruby/**,tmp/cache
```

The [`wildmenu`][wildmenu] option also controls the behavior of filename
completion in the sense that it tells Vim to show a menu when there is more than
one completion for the string typed. Filenames can be chosen with the arrow
keys, <kbd>Tab</kbd>, or <kbd>Ctrl</kbd>-<kbd>P</kbd> and
<kbd>Ctrl</kbd>-<kbd>N</kbd>.

[wildmenu]: http://vimdoc.sourceforge.net/htmldoc/options.html#'wildmenu'

``` vim
set wildmenu
```
