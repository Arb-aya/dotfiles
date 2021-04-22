vim-hardtime to learn to navigate buffers better

# Nvim

To make the current line go to the top of the view: `zt`

To go back to the previously open buffer: `Ctrl + ^`

You can delete/change/find upto and including a character using `f`. For example presuming | is cursor:
 
 |Hello World" my name is Arbaya -> `df"` -> my name is Arbaya 

You can delete/change/find upto and excluding a character using `t`. For example presuming | is cursor:

 |Hello World" my name is Arbaya -> `dt"` -> " my name is Arbaya 

## vim-surround
`Ctrl + S a` = <>
`Ctrl + S B `= {}
`Ctrl + S b `= ()
`Ctrl + S r `= []
`Ctrl + S "` = ""

Using `Ctrl + S Ctrl + S (B/b/r/"/')` will put a line between them.

```
Ctrl + S Ctrl + s B = {
	
} 
```

## Dirvish
`-` to view files
`:e` to create a new file
`% <tab>` to expand to full file path
`x` to mark files
Use `:Shdo` to modify selected file paths and `Z!` or `!%` to execute it
`a` to open file in new vertical split
`t` in new tab
`h` in new horizontal split
`:vs .` better way to open files in splits

## Tabularize

`<leader>a=` - Align on =
`<leader>a:` - Align on :

## Telescope

`<leader>ff` - Find files
`<leader>fg` - live grep
`<leader>fb` - find buffers
`<leader>fg` - find help tags


## General vim commands
Highlight text and use gq to format it. Set line length in vimrc with
set textwidth

Search and replace:

:s/pattern/string/

all patterns found:

:s/pattern/string/g

To search the whole file:

:%s/pattern/string/g


# Get under your fingers:

## Learn about fold and use them

## Learn about tags and use them

## Tabularize

`<leader>a=` - Align on =
`<leader>a:` - Align on :

## Telescope

`<leader>ff` - Find files
`<leader>fg` - live grep
`<leader>fb` - find buffers
`<leader>fg` - find help tags
