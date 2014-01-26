name             "titan"
maintainer       "Martin Biermann"
maintainer_email "info@martinbiermann.com"
license          "MIT"
description      "Opscode Chef cookbook for installing the graph database Titan server including the Rexster server for HTTP access"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "apt"
depends "java"
