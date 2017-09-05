#!/bin/bash
# Copyright London Stock Exchange Group All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
set -e
# This script expedites the chaincode development process by automating the
# requisite channel create/join commands

# We use a pre-generated orderer.block and channel transaction artifact (myc.tx),
# both of which are created using the configtxgen tool

# first we create the channel against the specified configuration in myc.tx
# this call returns a channel configuration block - myc.block - to the CLI container
peer channel create -c helloch -f helloch.tx -o orderer:7050

# now we will join the channel and start the chain with myc.block serving as the
# channel's first block (i.e. the genesis block)
peer channel join -b helloch.block

# Now the user can proceed to build and start chaincode in one terminal
# And leverage the CLI container to issue install instantiate invoke query commands in another

#peer chaincode install -n hello -v 1.0 -l java -p /Users/friends/gopath/src/github.com/hyperledger/fabric-samples/chaincode-docker-devmode/chaincode/hsl-hsl-user-guide-examples-v14/mytest
#peer chaincode instantiate -o 127.0.0.1:7050 -C helloch  -n hello -v 1.0 -l java -c "{\"Args\":[\"init\",\"a\", \"100\", \"b\",\"100\"]}"
#peer chaincode query -o orderer:7050 -C helloch -n hello -c "{\"Args\":[\"user.get\",\"\",\"LiLei\"]}"


#we should have bailed if above commands failed.
#we are here, so they worked
sleep 600000
exit 0
