#Ieronim E Oltean Developer Blog

## Before You Begin

In the _config.yml file, the base URL is set to /startbootstrap-clean-blog-jekyll which is this themes gh-pages preview. It's recommended that you remove the base URL before working with this theme locally!

It should look like this:
`baseurl: ""`

## Instructions

A full Jekyll environment is included with this theme. Assuming you have Ruby and bundler installed, in terminal run 'gem install jekyll bundler'. Then update your build by running 'bundle install' and run `bundle execute jekyll serve --watch` to run a web server that automatically watches for version changes in the source files. You can now edit files and refresh to see changes on the web server.

A Grunt environment is also included. There are a number of tasks it performs like minification of the JavaScript, compiling of the LESS files, adding banners to apply the MIT license, and watching for changes. Run the grunt default task by entering `grunt` into your command line which will build the files. You can use `grunt watch` if you are working on the JavaScript or the LESS.

You can run `jekyll serve --watch` and `grunt watch` at the same time to watch for changes and then build them all at once.

## Why Jekyll?

Jekyll is a web server that runs on github. It's not as robust as Ruby on Rails, or as hot as React, but godamnit it works.
