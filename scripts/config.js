var moonCatAddress="0x60cd862c9C687A9dE49aecdC3A99b74A4fc54aB6";
var moonCatAbi=[{"constant":false,"inputs":[{"name":"catId","type":"bytes5"},{"name":"price","type":"uint256"}],"name":"makeAdoptionOffer","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"activate","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"remainingGenesisCats","outputs":[{"name":"","type":"uint16"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"remainingCats","outputs":[{"name":"","type":"uint16"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"}],"name":"acceptAdoptionOffer","outputs":[],"payable":true,"type":"function"},{"constant":true,"inputs":[],"name":"mode","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"catId","type":"bytes5"}],"name":"getCatDetails","outputs":[{"name":"id","type":"bytes5"},{"name":"owner","type":"address"},{"name":"name","type":"bytes32"},{"name":"onlyOfferTo","type":"address"},{"name":"offerPrice","type":"uint256"},{"name":"requester","type":"address"},{"name":"requestPrice","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getCatOwners","outputs":[{"name":"","type":"address[]"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes5"}],"name":"catOwners","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"withdraw","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"rescueOrder","outputs":[{"name":"","type":"bytes5"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"seed","type":"bytes32"}],"name":"rescueCat","outputs":[{"name":"","type":"bytes5"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"}],"name":"cancelAdoptionOffer","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getCatIds","outputs":[{"name":"","type":"bytes5[]"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getCatNames","outputs":[{"name":"","type":"bytes32[]"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"},{"name":"catName","type":"bytes32"}],"name":"nameCat","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"activateInTestMode","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes5"}],"name":"adoptionOffers","outputs":[{"name":"exists","type":"bool"},{"name":"catId","type":"bytes5"},{"name":"seller","type":"address"},{"name":"price","type":"uint256"},{"name":"onlyOfferTo","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes5"}],"name":"catNames","outputs":[{"name":"","type":"bytes32"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getCatRequestPrices","outputs":[{"name":"","type":"uint256[]"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"}],"name":"cancelAdoptionRequest","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"disableBeforeActivation","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"addGenesisCatGroup","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"},{"name":"price","type":"uint256"},{"name":"to","type":"address"}],"name":"makeAdoptionOfferToAddress","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"searchSeed","outputs":[{"name":"","type":"bytes32"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"imageGenerationCodeMD5","outputs":[{"name":"","type":"bytes16"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes5"}],"name":"adoptionRequests","outputs":[{"name":"exists","type":"bool"},{"name":"catId","type":"bytes5"},{"name":"requester","type":"address"},{"name":"price","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"}],"name":"acceptAdoptionRequest","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getCatOfferPrices","outputs":[{"name":"","type":"uint256[]"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"}],"name":"makeAdoptionRequest","outputs":[],"payable":true,"type":"function"},{"constant":true,"inputs":[],"name":"rescueIndex","outputs":[{"name":"","type":"uint16"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"pendingWithdrawals","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"catId","type":"bytes5"},{"name":"to","type":"address"}],"name":"giveCat","outputs":[],"payable":false,"type":"function"},{"inputs":[],"payable":true,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"to","type":"address"},{"indexed":true,"name":"catId","type":"bytes5"}],"name":"CatRescued","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"catId","type":"bytes5"},{"indexed":false,"name":"catName","type":"bytes32"}],"name":"CatNamed","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"catId","type":"bytes5"},{"indexed":false,"name":"price","type":"uint256"},{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"}],"name":"CatAdopted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"catId","type":"bytes5"},{"indexed":false,"name":"price","type":"uint256"},{"indexed":true,"name":"toAddress","type":"address"}],"name":"AdoptionOffered","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"catId","type":"bytes5"}],"name":"AdoptionOfferCancelled","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"catId","type":"bytes5"},{"indexed":false,"name":"price","type":"uint256"},{"indexed":true,"name":"from","type":"address"}],"name":"AdoptionRequested","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"catId","type":"bytes5"}],"name":"AdoptionRequestCancelled","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"catIds","type":"bytes5[16]"}],"name":"GenesisCatsAdded","type":"event"}];
var moonCatCreationBlock=4134866;