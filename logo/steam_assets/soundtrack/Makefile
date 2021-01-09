TOOLSDIR := ../../../tools
OUTDIR := ../../../out/logo/steam_assets/soundtrack
OUTPUTS := $(patsubst %.xcf,$(OUTDIR)/%.png,$(wildcard *.xcf))

all: $(OUTPUTS)
$(OUTDIR):
	mkdir -p $@

$(OUTDIR)/%.png: %.xcf | $(OUTDIR)
	$(TOOLSDIR)/gimp_xcf_export.sh -f "$<" -o "$@"

.PHONY: all
