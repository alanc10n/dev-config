#!/bin/bash
# Install packages, do any other linux-specific stuff
# currently only supporting apt-based installs
# virtualbox? vagrant?
sudo apt-get update
sudo apt-get install -y build-essential git python-pip
