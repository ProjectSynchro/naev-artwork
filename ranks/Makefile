TOOLSDIR := ../tools
OUTDIR := ../out/ranks
LOGOS_OUTPUTS := $(patsubst %.svg,$(OUTDIR)/%.png,$(wildcard *.svg))
OUTPUTS := $(LOGOS_OUTPUTS)

all: $(OUTPUTS)

$(OUTDIR):
	mkdir -p $@

$(OUTDIR)/%.png: %.svg | $(OUTDIR)
	$(TOOLSDIR)/inkscape_export.sh -f "$<" -o "$@"

.PHONY: all
