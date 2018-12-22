# dzi-dl-docker

A docker image for running [dzi-dl](https://github.com/ryanfb/dzi-dl) on a given URL.

It downloads a full-resolution image of a DZI image embedded on a page.

## Building

Build the image with
    docker build -t dzi-dl .

## Running

For running the image, you need to provide an output directory at "/result" and a page URL:
    docker run -it --rm -v $PWD:/result dzi-dl <url>

## Limitations

Currently works for only one image per page.
