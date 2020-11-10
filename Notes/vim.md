# Nvim

To make the current line go to the top of the view: `zt`

To go back to the previously open buffer: `Ctrl + 6`

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


## General vim commands
Highlight text and use gq to format it. Set line length in vimrc with
set textwidth
