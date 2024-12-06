#!/bin/bash

set -e

dkms_name="hid-magicmouse-dkms"
#dkms_version="6.11+magicmouse2"
dkms_version="6.12.1-zen1-1-zen+magicmouse2"

if dkms status -m $dkms_name -v $dkms_version | egrep '(added|built|installed)' >/dev/null ; then
  # if dkms bindings exist, remove them
  dkms remove $dkms_name/$dkms_version --all
fi
