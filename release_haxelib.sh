#!/bin/sh
rm -f Numerix.zip
zip -r Numerix.zip src *.hxml *.json *.md run.n
haxelib submit Numerix.zip $HAXELIB_PWD --always