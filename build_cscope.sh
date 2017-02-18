#!/bin/sh
cscope -Rb -s $1
mv cscope.out ~/.cscope.out
