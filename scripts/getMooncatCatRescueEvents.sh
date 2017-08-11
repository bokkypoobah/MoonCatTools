#!/bin/sh

geth attach << EOF | grep "RESULT: " | sed "s/RESULT: //"
loadScript("config.js");

var moonCat=eth.contract(moonCatAbi).at(moonCatAddress);
moonCat

var toBlock = eth.blockNumber;
var i;
var catRescuedEvents = moonCat.CatRescued({}, { fromBlock: moonCatCreationBlock, toBlock: toBlock });
i = 0;
catRescuedEvents.watch(function (error, result) {
    console.log("RESULT: CatRescued " + i++ + " #" + result.blockNumber + ": to=" + result.args.to + " catId=" + result.args.catId);
});
catRescuedEvents.stopWatching();

EOF
