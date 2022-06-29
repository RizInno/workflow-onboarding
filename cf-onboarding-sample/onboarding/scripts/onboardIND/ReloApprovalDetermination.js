var reloInfo = $.context.equipment.RelocationInfo; var relototal = 0;
var relototalInfo = [];
var relototequip = {};
if (reloInfo.length > 0) {
    for (var i = 0; i < reloInfo.length; i++) {
        relototequip = reloInfo[i];
        relototal = relototal + relototequip.Price; relototalInfo.push(relototequip);
    }
} else {
    relototequip = reloInfo;
    relototal = relototal + relototequip.Price; relototalInfo.push(relototequip);
}
$.context.equipment.Relototal = relototal;
var Vocabularyrelo = [{
    "TotalEquipmentAmount": {
        "TotalAmount": relototal
    }
}];
var rulesPayloadrelototal = {
    "RuleServiceId": "75fb3d505d0c40a8ae73e2e7b4566cb2", //"RuleServiceVersion": "000002000007000000", 
    "Vocabulary": Vocabularyrelo
};
$.context.rulesPayloadrelototal = rulesPayloadrelototal;