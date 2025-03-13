class ApiResponseStatus {


  var responseStatus = {
    '33' : "No Issues are registered",
    '32' : "Empty list of issues",
    '17' : "Farmer code is missing",
    '4' : "Farmer name is missing",
    '7' : "Produce code is missing",
    '8' : "Service name is missing",
    '9' : "Farming date Is missing",
    '10' : "Farmed area is missing",
    '19' : "Farm serial is missing",
    '13' : "Harvest date is missing",
    '3' : "Canal name is missing",
    '2' : "Wrong credentials",
    '18' : "Farmer not found",
    '20' : "Issue code is missing",
    '31' : "Issue not logged",
    '5' : "Activities not found",
    '6' : "Activity fees not found",
    '11' : "Office name is missing",
    '42' : "Description is missing",
    '40' : "Id Number is missing",
    '41' : "Invalid amount",
  };

  String? getResponseMessageByCode(String code)
  {
    return responseStatus[code];
  }


}