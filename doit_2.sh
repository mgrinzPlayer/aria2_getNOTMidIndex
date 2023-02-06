#!/bin/sh
tar -xf libraries_and_aria/aria2-1.36.0.tar.gz
patch -p1 < patch_github_action.patch
mv aria2-1.36.0/src/BitfieldMan.cc aria2-1.36.0/src/BitfieldMan.mytemplate
