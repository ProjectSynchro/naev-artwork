TOOLSDIR := ../../../tools
OUTDIR := ../../../out/logo/steam_assets/library
OUTPUTS := $(patsubst %.xcf,$(OUTDIR)/%.png,$(wildcard *.xcf))

all: library capsule

library: $(OUTPUTS)
$(OUTDIR):
	mkdir -p $@

$(OUTDIR)/%.png: %.xcf | $(OUTDIR)
	$(TOOLSDIR)/gimp_xcf_export.sh -f "$<" -o "$@"

capsule:
	$(MAKE) -C capsule

.PHONY: library capsule
