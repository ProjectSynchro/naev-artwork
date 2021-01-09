TOOLSDIR := ../../../../tools
OUTDIR := ../../../../out/logo/steam_assets/library/capsule
OUTPUTS := $(patsubst %.mlt,$(OUTDIR)/%.png,$(wildcard *.mlt))

all: $(OUTPUTS)
$(OUTDIR):
	mkdir -p $@

$(OUTDIR)/%.png: %.mlt | $(OUTDIR)
	$(TOOLSDIR)/render_library_capsule.sh -f "$<" -o "$(OUTDIR)"

.PHONY: all
