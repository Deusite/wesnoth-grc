#!/bin/sh

#
# Script to make mo files and put them in a zip file
# Requires a a git clone named "wesnoth-grc" in the root of your home directory
#

LANG=grc
DIRS=" \
	wesnoth \
	wesnoth-anl \
	wesnoth-aoi \
	wesnoth-did \
	wesnoth-dm \
	wesnoth-dw \
	wesnoth-editor \
	wesnoth-ei \
	wesnoth-help \
	wesnoth-httt \
	wesnoth-l \
	wesnoth-lib \
	wesnoth-low \
	wesnoth-manpages \
	wesnoth-manual \
	wesnoth-multiplayer \
	wesnoth-nr \
	wesnoth-sof \
	wesnoth-sotbe \
	wesnoth-tb \
	wesnoth-test \
	wesnoth-thot \
	wesnoth-trow \
	wesnoth-tsg \
	wesnoth-tutorial \
	wesnoth-units \
	wesnoth-utbs"

cd /tmp
mkdir tmp-make-mo-package
cd tmp-make-mo-package
mkdir translations
cd translations
mkdir ${LANG}
cd ${LANG}
mkdir LC_MESSAGES
PACKAGE_PALACE_PLACE=/tmp/tmp-make-mo-package/translations
PO_PALACE_PLACE=~/wesnoth-${LANG}/mainline
cd ${PACKAGE_PALACE_PLACE}/${LANG}/LC_MESSAGES
for d in $DIRS; do
	mkdir ${d}
	msgfmt ${PO_PALACE_PLACE}/${d}/${LANG}.po -o ${PACKAGE_PALACE_PLACE}/${LANG}/LC_MESSAGES/${d}/${d}.mo
done
cd ${PACKAGE_PALACE_PLACE}
cd ..
zip -9 -r -q /tmp/mo-files.zip translations/
rm -rf /tmp/tmp-make-mo-package
