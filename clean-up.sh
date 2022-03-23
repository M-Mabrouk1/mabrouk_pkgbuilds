#!/usr/bin/env bash 


# Go into x86_64 sub-directory and get a list of files
# not named PKGBUILD and not named *.install. 
find x86_64 -type f -not -name PKGBUILD -not -name "*.install" -delete
find x86_64 -type d -name src -delete
