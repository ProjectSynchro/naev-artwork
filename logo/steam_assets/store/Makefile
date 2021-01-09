TOOLSDIR := ../../../tools
OUTDIR := ../../../out/steam
OUTPUTS := $(patsubst %.xcf,$(OUTDIR)/%.png,$(wildcard *.xcf))

all: $(OUTPUTS)
$(OUTDIR):
	mkdir -p $@

$(OUTDIR)/%.png: %.xcf | $(OUTDIR)
	$(TOOLSDIR)/gimp_export.sh -f "$<" -o "$@"

.PHONY: all
