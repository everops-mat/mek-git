default: all

docs: mek-git.html mek-git

all:
	@echo nothing here now.
	
mek-git.html: mek-git.nw
	@noweave -filter btdefn -filter l2h -index -html mek-git.nw > mek-git.html

mek-git: mek-git.nw
	@notangle -Rmek-git -m3 mek-git.nw > mek-git
	
