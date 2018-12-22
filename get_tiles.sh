#!/bin/bash
# This script scrapes a dzi/xml URL from a given URL and downloads it via dzi-dl

OUTPUT_DIR="/result"

if [ ! -d "${OUTPUT_DIR}" ]; then
    echo "You need to mount an output directory, e.g.: '-v \$PWD:${OUTPUT_DIR}'!"
    exit 1
fi

if [ $# -lt 1 ]; then
    echo "Usage: $0 http://some.url/with/an/embedded/dzi/image/"
    exit 1
fi

# Extract the dzi URL from a given page
URL=$(QT_QPA_PLATFORM=offscreen phantomjs /dzi-dl/dzixmlreqs.js "$1")

# Run dzi-dl with the URL
cd /dzi-dl
bundle exec ./dzi-dl.rb "${URL}"

# Copy the resulting image to the output directory
cp -v dzc_output.jpg ${OUTPUT_DIR}/output.jpg
