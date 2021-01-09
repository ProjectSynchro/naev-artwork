RES_TINY := $(if $(HIDPI),48,24)
RES_SMALL := $(if $(HIDPI),128,64)
TOOLSDIR := ../../tools
OUTDIR := ../../out/logo
TINY_OUTPUTS := $(patsubst %.svg,$(OUTDIR)/%_tiny.png,$(wildcard *.svg))
SMALL_OUTPUTS := $(patsubst %.svg,$(OUTDIR)/%_small.png,$(wildcard *.svg))
OUTPUTS := $(TINY_OUTPUTS) $(SMALL_OUTPUTS)

all: $(OUTPUTS)

$(OUTDIR):
	mkdir -p $@

$(OUTDIR)/%_tiny.png: %.svg | $(OUTDIR)
	$(TOOLSDIR)/inkscape_export.sh -f "$<" -o "$@" -w $(RES_TINY) -h $(RES_TINY) 

$(OUTDIR)/%_small.png: %.svg | $(OUTDIR)
	$(TOOLSDIR)/inkscape_export.sh -f "$<" -o "$@" -w $(RES_SMALL) -h $(RES_SMALL) 

.PHONY: all
