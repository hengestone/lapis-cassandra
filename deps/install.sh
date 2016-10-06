#!/bin/sh
sudo luarocks install penlight
( cd lua-resty-mongol/ ; sudo make install )
