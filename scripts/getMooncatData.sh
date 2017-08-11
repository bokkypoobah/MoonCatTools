#!/bin/sh

geth attach << EOF
loadScript("config.js");

var moonCat=eth.contract(moonCatAbi).at(moonCatAddress);
moonCat



EOF
