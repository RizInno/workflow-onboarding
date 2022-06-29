

var empData = $.context.CInfo.d;
/************ Prepare Input Payload to Execute Rules ****************/
var employeeRelo = {};
employeeRelo.countryOfCompany = $.context.response.countryCode; employeeRelo.company = $.context.response.country; employeeRelo.jobDepartment = empData.department;
var VocabularyReloEmp = [{
    "Employee": employeeRelo
}];
var rulesPayloadRelo = {
    "RuleServiceId": "212cb8521df94b419d50c05023e23c1d", //"RuleServiceVersion": "000000000000000000",
     "Vocabulary": VocabularyReloEmp
};
$.context.rulesPayloadRelo = rulesPayloadRelo;