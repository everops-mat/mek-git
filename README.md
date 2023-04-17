# mek-git
A tcl wrapper for git

This is my `literate` attempt at a tcl git wrapper. The main purpose 
is to prevent me from doing commits in `main' branches AND to also
add a few helpful git commands that I run. For example:

 * I like to do a git fetch --all -p -t and git pull , I called it update.

This is written in TCL using only the standard library so it should work
out of the box on just about anything. 

I still need to create a man page and a decent help section.

## How to get the script.

 * You need to install noweb.
   * Actually, you don't. You just need docker installed. 
 * `make mek-git` will create the script. Copy it to any location you want.
 * `make mek-git.pdf` will give you a PDF copy of the script documentation.
 * `make mek-git.html` will give you a HTML copy of the script documentation.

I have created a [PR Template](pull_request_template.md) probably not for use for this project, but I wanted to work on it. 
