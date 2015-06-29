#!/bin/bash

NAT_EXTIP=$(curl -s http://ipecho.net/plain)
geth --rpc --nat extip:$NAT_EXTIP
