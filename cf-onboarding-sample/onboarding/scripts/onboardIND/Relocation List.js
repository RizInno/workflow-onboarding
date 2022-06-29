var RelosInfo = $.context.equipment.ReloInfo.Result[0].RelocationList; var empData = $.context.CInfo.d;
var RelocationInfo = [];
var reloequip = {};
if (RelosInfo.length > 0) {
    for (var i = 0; i < RelosInfo.length; i++) {
        reloequip = RelosInfo[i];
        reloequip.ProdDesc = reloequip.ProductDesc; reloequip.Status = "Book"; reloequip.RequestedLoc = empData.location; RelocationInfo.push(reloequip);
    }
} else {
    reloequip = RelosInfo;
    reloequip.ProdDesc = reloequip.ProductDesc; reloequip.Status = "Book"; reloequip.RequestedLoc = empData.location; RelocationInfo.push(reloequip);
}
$.context.equipment.RelocationInfo = RelocationInfo;