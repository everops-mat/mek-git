TARGETS  := mek-git mek-git.pdf mek-git.html
DOCKER   := mek:noweb
NOTANGLE := docker run -u $(USER) -v $(PWD):$(HOME) --rm -t $(DOCKER) notangle
NOWEAVE  := docker run -u $(USER) -v $(PWD):$(HOME) --rm -t $(DOCKER) noweave
PDFLATEX := docker run -u $(USER) -v $(PWD):$(HOME) --rm -t $(DOCKER) pdflatex
default: all

all: $(TARGETS)

clean:
	@rm -f *~ $(TARGETS) *.latex *.dvi *.log *.aux
	
mek-git.html: dockerbuild mek-git.nw
	$(NOWEAVE) -filter btdefn -filter l2h -index -t -t2 -html /mek-git.nw > mek-git.html

mek-git.pdf: dockerbuild mek-git.nw
	$(NOWEAVE) -filter btdefn -index -latex -t -t2 mek-git.nw > mek-git.latex
	$(PDFLATEX) mek-git.latex
	$(PDFLATEX) mek-git.latex

mek-git: dockerbuild mek-git.nw
	$(NOTANGLE) -Rmek-git -m3 mek-git.nw > mek-git

.PHONY: dockerbuild
dockerbuild: dockerfile.noweb
	docker build -t $(DOCKER) --build-arg "USER=$(USER)" --build-arg "HOME=$(HOME)" -f $< .
