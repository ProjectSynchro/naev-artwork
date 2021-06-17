#!/bin/bash
# inkscape export script

# Renders svg to a png (takes into account the various syntax that inkscape uses..)
# Pass in -f <svgFile> -o <outputDir> 

set -e

while getopts d:f:o:w:h: OPTION "$@"; do
    case $OPTION in
    d)
        set -x
        ;;
    f)
        SVGFILE=${OPTARG}
        ;;
    o)
        OUTPUTDIR=${OPTARG}
        ;;
    w)
        EXPORTWIDTH=${OPTARG}
        ;;
    h)
        EXPORTHEIGHT=${OPTARG}
        ;;
    esac
done

if [[ -z "$SVGFILE" ]]; then
    echo "usage: `basename $0` [-d] -f <xcfFile> -o <outputDir>"
    exit 1
elif [[ -z "$OUTPUTDIR" ]]; then
    echo "usage: `basename $0` [-d] -f <xcfFile> -o <outputDir>"
    exit 1
fi

if ! [ -x "$(command -v inkscape)" ]; then
    echo "You don't have Inkscape installed!, install it for your distro."
    echo "Failed to generate $OUTPUTDIR"
    exit 1
else
    targetVer="1.0.0"
    installedVer="$(inkscape --version)"
    parsedVer="$(echo $installedVer | egrep -o '[0-9].*.[0-9] ')"

    if [ "$(printf '%s\n' "$parsedVer" "$targetVer" | sort -V | head -n1)" = "$targetVer" ]; then
        if [[ -z "$EXPORTWIDTH" || -z "$EXPORTHEIGHT" ]]; then
            inkscape "${SVGFILE}" --export-filename "${OUTPUTDIR}"
        else
            inkscape "${SVGFILE}" -w "${EXPORTWIDTH}" -h "${EXPORTHEIGHT}" --export-filename "${OUTPUTDIR}"
        fi
    else
        if [[ -z "$EXPORTWIDTH" || -z "$EXPORTHEIGHT" ]]; then
            inkscape -z "${SVGFILE}" -e "${OUTPUTDIR}"
        else
            inkscape -z "${SVGFILE}" -w "${EXPORTWIDTH}" -h "${EXPORTHEIGHT}" -e "${OUTPUTDIR}"
        fi
    fi
fi
