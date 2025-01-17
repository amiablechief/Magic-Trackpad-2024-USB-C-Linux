#!/bin/bash

set -e
set -x

dkms_name="hid-magicmouse-dkms"
#dkms_version="6.11+magicmouse2"
dkms_version="6.12.1-zen1-1-zen+magicmouse2"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# add
if ! dkms status -m $dkms_name -v $dkms_version | egrep '(added|built|installed)' >/dev/null ; then
  dkms add ${DIR}/../linux/drivers/hid
fi

# build
if ! dkms status -m $dkms_name -v $dkms_version  | egrep '(built|installed)' >/dev/null ; then
  dkms build $dkms_name/$dkms_version
fi

# install
if ! dkms status -m $dkms_name -v $dkms_version  | egrep '(installed)' >/dev/null; then
  dkms install --force $dkms_name/$dkms_version
fi
