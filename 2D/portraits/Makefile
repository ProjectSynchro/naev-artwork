RES := $(if $(HIDPI),400x300,200x150)
TOOLSDIR := ../../tools
OUTDIR := ../../out/portraits
SOURCES := $(shell find -name '*.xcf')
OUTPUTS := $(patsubst %.xcf,$(OUTDIR)/%.png,$(SOURCES))

all: $(OUTPUTS)

$(OUTDIR)/%.png: %.xcf
	@mkdir -p "$(dir $@)"
	$(TOOLSDIR)/gimp_export.sh -f "$<" -o "$@"
	convert -crop 1680x1260+120+180 +repage "$@" "$@"
	composite "$@" background.png "$@"
	convert -scale "$(RES)" -sharpen 0.25x0 "$@" "$@" 

.PHONY: all
