#!/bin/sh
while test $# -gt 2; do shift; done
gvimdiff $@

