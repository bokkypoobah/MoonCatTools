#!/bin/sh

MOONCATDATA=MoonCatEventData.txt
MOONCATRESULTS=MoonCatEventResults.tsv

geth attach << EOF | tee $MOONCATDATA
loadScript("config.js");

// NOTE - set infoLevel* to 1 to display additional data, 2 to display more additional data

// event CatRescued(address indexed to, bytes5 indexed catId);
var topicCatRescued = web3.sha3("CatRescued(address,bytes5)");
var infoLevelCatRescued = 0;

// event CatNamed(bytes5 indexed catId, bytes32 catName);
var topicCatNamed = web3.sha3("CatNamed(bytes5,bytes32)");
var infoLevelCatNamed = 0;

// event Transfer(address indexed from, address indexed to, uint256 value);
var topicTransfer = web3.sha3("Transfer(address,address,uint256)");
var infoLevelTransfer = 0;

// event CatAdopted(bytes5 indexed catId, uint price, address indexed from, address indexed to);
var topicCatAdopted = web3.sha3("CatAdopted(bytes5,uint256,address,address)");
var infoLevelCatAdopted = 0;

// event AdoptionOffered(bytes5 indexed catId, uint price, address indexed toAddress);
var topicAdoptionOffered = web3.sha3("AdoptionOffered(bytes5,uint256,address)");
var infoLevelAdoptionOffered = 0;

// event AdoptionOfferCancelled(bytes5 indexed catId);
var topicAdoptionOfferCancelled = web3.sha3("AdoptionOfferCancelled(bytes5)");
var infoLevelAdoptionOfferCancelled = 0;

// event AdoptionRequested(bytes5 indexed catId, uint price, address indexed from);
var topicAdoptionRequested = web3.sha3("AdoptionRequested(bytes5,uint256,address)");
var infoLevelAdoptionRequested = 0;

// event AdoptionRequestCancelled(bytes5 indexed catId);
var topicAdoptionRequestCancelled = web3.sha3("AdoptionRequestCancelled(bytes5)");
var infoLevelAdoptionRequestCancelled = 0;

// event GenesisCatsAdded(bytes5[16] catIds);
var topicGenesisCatsAdded = web3.sha3("GenesisCatsAdded(bytes5[16])");
var infoLevelGenesisCatAdded = 0;


var moonCat=eth.contract(moonCatAbi).at(moonCatAddress);

var fromBlock = moonCatCreationBlock;
// var fromBlock = eth.blockNumber - 10000;
var toBlock = eth.blockNumber;
var i;
var j;

console.log("RESULT: Block\tEvent\tCatId\tData1\tData2\tData3");
var eventFilter = eth.filter({fromBlock: fromBlock, toBlock: toBlock, address: moonCatAddress});
var events = eventFilter.get();
for (i = 0; i < events.length; i++) {
  var event = events[i];
  var topic0 = event.topics[0];
  if (topic0 == topicCatRescued) {
    if (infoLevelCatRescued > 1) {
      console.log("CatRescued: " + JSON.stringify(event));
    }
    var to = "0x" + event.topics[1].substring(2 + 24, 2 + 64);
    var catId = "0x" + event.topics[2].substring(2, 12);
    console.log("RESULT: " + event.blockNumber + "\tCatRescued\tcatId=" + catId + "\tto=" + to + "\t\t");

  } else if (topic0 == topicCatNamed) {
    if (infoLevelCatNamed > 1) {
      console.log("CatNamed: " + JSON.stringify(event));
    }
    var catId = "0x" + event.topics[1].substring(2, 12);
    var catName = web3.toAscii(event.data).replace(/\0/g, "");
    console.log("RESULT: " + event.blockNumber + "\tCatNamed\tcatId=" + catId + "\tname=" + catName + "\t\t");

  } else if (topic0 == topicTransfer) {
    if (infoLevelTransfer > 1) {
      console.log("Transfer: " + JSON.stringify(event));
    }
    var from = "0x" + event.topics[1].substring(2 + 24, 2 + 64);
    var to = "0x" + event.topics[2].substring(2 + 24, 2 + 64);
    var value = new BigNumber(event.data.substring(2, 2 + 64), 16);
    console.log("RESULT: " + event.blockNumber + "\tTransfer\t\tfrom=" + from + "\tto=" + to + "\tvalue=" + value);

  } else if (topic0 == topicCatAdopted) {
    if (infoLevelCatAdopted > 1) {
      console.log("CatAdopted: " + JSON.stringify(event));
    }
    var catId = "0x" + event.topics[1].substring(2, 12);
    var from = "0x" + event.topics[2].substring(2 + 24, 2 + 64);
    var to = "0x" + event.topics[3].substring(2 + 24, 2 + 64);
    var price = web3.fromWei(new BigNumber(event.data.substring(2, 2 + 64), 16), "ether");
    console.log("RESULT: " + event.blockNumber + "\tCatAdopted\tcatId=" + catId + "\tfrom=" + from + "\tto=" + to + "\tprice=" + price);

  } else if (topic0 == topicAdoptionOffered) {
    if (infoLevelAdoptionOffered > 1) {
      console.log("AdoptionOffered: " + JSON.stringify(event));
    }
    var catId = "0x" + event.topics[1].substring(2, 12);
    var to = "0x" + event.topics[2].substring(2 + 24, 2 + 64);
    var price = web3.fromWei(new BigNumber(event.data.substring(2, 2 + 64), 16), "ether");
    console.log("RESULT: " + event.blockNumber + "\tAdoptionOffered\tcatId=" + catId + "\tto=" + to + "\tprice=" + price + "\t");

  } else if (topic0 == topicAdoptionOfferCancelled) {
    if (infoLevelAdoptionOfferCancelled > 1) {
       console.log("AdoptionOfferCancelled: " + JSON.stringify(event));
    }
    var catId = "0x" + event.topics[1].substring(2, 12);
    console.log("RESULT: " + event.blockNumber + "\tAdoptionOfferCancelled\tcatId=" + catId + "\t\t\t");

  } else if (topic0 == topicAdoptionRequested) {
    if (infoLevelAdoptionRequested > 1) {
       console.log("AdoptionRequested: " + JSON.stringify(event));
    }
    var catId = "0x" + event.topics[1].substring(2, 12);
    var price = web3.fromWei(new BigNumber(event.data.substring(2, 2 + 64), 16), "ether");
    var from = "0x" + event.topics[2].substring(2 + 24, 2 + 64);
    console.log("RESULT: " + event.blockNumber + "\tAdoptionRequested\tcatId=" + catId + "\tfrom=" + from + "\tprice=" + price + "\t");

  } else if (topic0 == topicAdoptionRequestCancelled) {
    if (infoLevelAdoptionRequestCancelled > 1) {
      console.log("AdoptionRequestCancelled: " + JSON.stringify(event));
    }
    var catId = "0x" + event.topics[1].substring(2, 12);
    console.log("RESULT: " + event.blockNumber + "\tAdoptionRequestCancelled\tcatId=" + catId + "\t\t\t");

  } else if (topic0 == topicGenesisCatsAdded) {
    if (infoLevelGenesisCatAdded > 1) {
      console.log("GenesisCatsAdded: " + JSON.stringify(event));
    }
    var data = event.data;
    for (j = 0; j < 16; j++) {
      var catId = "0x" + data.substring(2 + 0 + j * 64, 2 + 10 + j * 64);
      var catDetails = moonCat.getCatDetails(catId, event.blockNumber);
      var price = catDetails[4];
      console.log("RESULT: " + event.blockNumber + "\tGenesisCatsAdded\ti=" + j + "\tcatId=" + catId + "\tprice=" + web3.fromWei(price, "ether") + "\t");
       if (infoLevelGenesisCatAdded > 1) {
         console.log("\t\t" + JSON.stringify(catDetails));
       }
    }

  } else {
    // console.log(topic0);
  }
  // console.log(JSON.stringify(event));
  // console.log("");
}
// events.get(function (err, event) {
  //   console.log(JSON.stringify(event));
  // console.log("");
// });

exit;

// var catRescuedEvents = moonCat.CatRescued({}, { fromBlock: fromBlock, toBlock: toBlock });
// i = 0;
// catRescuedEvents.watch(function (error, result) {
    //    console.log("RESULT: CatRescued " + i++ + " #" + result.blockNumber + ": to=" + result.args.to + " catId=" + result.args.catId);
    // var catDetails = moonCat.getCatDetails(result.args.catId);
    // console.log("RESULT:   CatDetails " + JSON.stringify(catDetails));
// });
// catRescuedEvents.stopWatching();

EOF

grep -a "RESULT: " $MOONCATDATA | sed "s/RESULT: //" > $MOONCATRESULTS
cat $MOONCATRESULTS