#!/bin/sh
rm -rf lua-cbson
git clone https://github.com/isage/lua-cbson

# Check for cmake
# CMAKE = 

( cd lua-cbson ; mkdir build ; cd build ; cmake .. ; make && sudo make install )
