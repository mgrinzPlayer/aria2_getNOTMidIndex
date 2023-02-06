#!/bin/sh
export HOST=x86_64-w64-mingw32
export PREFIX=$PWD/forARIA2/$HOST

doit(){
awk "{sub(/#MYPERCENT#/,$1); print}" src/BitfieldMan.mytemplate > src/BitfieldMan.cc
make -j4
${HOST}-strip src/aria2c.exe
cp src/aria2c.exe ../binaries/aria2c-a$1.exe
}

mkdir binaries
cd aria2-1.36.0
./mingw-config

doit 70
doit 75
doit 80
doit 90
doit 95
doit 99

echo DONE
