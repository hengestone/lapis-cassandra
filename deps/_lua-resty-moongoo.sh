#!/bin/sh
rm -rf lua-resty-moongoo
git clone https://github.com/isage/lua-resty-moongoo
( cd lua-resty-moongoo ; sudo cp -avf lib/resty/* /usr/local/openresty/lualib/resty/ )
