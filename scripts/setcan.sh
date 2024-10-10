#!/bin/bash

################################################################################
#                                                                              #
# Copyright (C) 2020 Fondazione Istitito Italiano di Tecnologia (IIT)          #
# All Rights Reserved.                                                         #
#                                                                              #
################################################################################

# enable the esd can device

sudo ip link set can0 type can bitrate 1000000
sudo ip link set up can0

