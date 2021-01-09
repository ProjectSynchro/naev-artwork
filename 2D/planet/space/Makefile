RES := $(if $(HIDPI),400x300,200x150)
TOOLSDIR := ../../../tools
OUTDIR := ../../out/planet/space
SOURCES := $(shell find -name '*.psd')
OUTPUTS := $(patsubst %.psd,$(OUTDIR)/%.png,$(SOURCES))

all: $(OUTPUTS)

$(OUTDIR)/%.png: %.psd
	@mkdir -p "$(dir $@)"
	$(TOOLSDIR)/gimp_export.sh -f "$<" -o "$@"

.PHONY: all
