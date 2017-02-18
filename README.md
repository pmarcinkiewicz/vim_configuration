# Introducion

This is vim configuration used by Piotr Marcinkiewicz. It is based on .vimrc
created by Dominique Pelle <dominique.pelle at gmail.com>.

1. It uses Rastafarian colours to introduce some positive vibrations during
   coding.
2. .vimrc was optimized for both Mac OS and Linux.
3. You can use it to edit C/C++ and JavaScript.
4. The configuration fails to support mouse interaction.

# Installation

You need to run:
```
 $ git clone https://github.com/pmarcinkiewicz/vim_configuration.git
 $ cd vim_configuration
 # ./install.sh
```

# Cscope

The repo contains script to generate cscope tags database. Usage is very simple:

```
 $ ./build_cscope.sh your_path_with_sources
```

You should uncomment lines about cscope in .vimrc to enable it. It is possible
to load databases for several projects.

# Shortcuts

* F2 - enables/disables set paste
* F3 - enables/disables showing line numbers
* F4 - enables/disables highlight for search results
* F5 - enables/disables display of white space characters
* F7 - switches to next language in myspell (en-gb, pl supported)
* F8 - enables/disables myspell
* F9 - underline current line
* F12 - rebuild ctags
