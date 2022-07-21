#!/usr/bin/env bash
cf create-shared-domain apps.internal --internal 2> error.txt
more error.txt
cat error.txt | grep "The domain name is taken|is already in use" | head -1 | xargs -r echo "Looks like domain exists, quitting with 0 code!" && exit 0
rm error.txt