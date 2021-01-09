#!/bin/bash
# gimp psd export script

# Renders psd project to a png
# Pass in -f <psdFile> -o <outputDir> 

set -e

while getopts d:f:o: OPTION "$@"; do
    case $OPTION in
    d)
        set -x
        ;;
    f)
        PSDFILE=${OPTARG}
        ;;
    o)
        OUTPUTDIR=${OPTARG}
        ;;
    esac
done

if [[ -z "$PSDFILE" ]]; then
    echo "usage: `basename $0` [-d] -f <psdFile> -o <outputDir>"
    exit 1
elif [[ -z "$OUTPUTDIR" ]]; then
    echo "usage: `basename $0` [-d] -f <psdFile> -o <outputDir>"
    exit 1
fi

if [[ ! -z $(command -v gimp) ]]; then
    GIMPEXEC=gimp
else
    echo "You're missing the gimp package for your distro."
    exit 1
fi

# Start gimp with script-fu convert-psd-png
{
cat <<EOF
(define (convert-psd-png ${PSDFILE} ${OUTPUTDIR})
    (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE "${PSDFILE}" "${PSDFILE}")))
        (layers (cadr (gimp-image-get-layers image)))
    )

    (gimp-item-set-visible (vector-ref layers (- (vector-length layers) 1)) 0)

    (let ((layer (car (gimp-image-merge-visible-layers image CLIP-TO-IMAGE))))
        (gimp-file-save RUN-NONINTERACTIVE image layer "${OUTPUTDIR}" "${OUTPUTDIR}"))
    )
)

(gimp-message-set-handler 1) ; Messages to standard output
EOF

echo "(convert-psd-png \"${PSDFILE}\" \"${OUTPUTDIR}\")"

echo "(gimp-quit 0)"

} | ${GIMPEXEC} -i -b -
