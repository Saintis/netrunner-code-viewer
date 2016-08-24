# Netrunner Code Viewer

The intention of this project is to make the [jinteki.net](http://jinteki.net) [code base](https://github.com/mtgred/netrunner) easier to explore.

## Current Coverage

Currently only the code snippets specific to cards are available to browsing.

## Usage

Run the shell script to update the source files stored in `clj/` (might fail if this folder is missing, just create it with `mkdir clj`)

Run the python scripts to generate markdown pages for each card type, and the data used to populate the pages.

Run the jekyll server as described on the [Quickstart](https://jekyllrb.com/docs/quickstart/), normally `bundle exec jekyll serve`. If it fails try `bundle install` first, otherwise consult the jekyll documentation.

Alternatively run the Makefile with `make`. This will run all the python scripts automatically (and in the correct order). 

Ensure that the shell script has the proper permissions for it to be run through `make`, `chmod +x update_clj.sh` should do it.

You can also run the server with `make serve`. Run `make` first if you have changed any of the clj files or the README.

Requires:

 - `python3` for the python scripts
 - `svn` for the shell script
 - `jekyll` for the server
 - `bundler` (might have to specifically install this to get the jekyll stuff to work...)

## Licenses

This project is licensed under the standard [MIT license](https://raw.githubusercontent.com/Saintis/netrunner-code-viewer/master/LICENSE.md).

Uses a slightly modified version of the [Minima](https://github.com/jekyll/minima) theme -- [MIT license](https://raw.githubusercontent.com/jekyll/minima/master/LICENSE.txt)

Uses [AnchorJS](http://bryanbraun.github.io/anchorjs/) for deep anchor links to cards -- [MIT license](https://opensource.org/licenses/MIT)