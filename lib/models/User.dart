class User{
  String id;
  String name='';
  String email;
  String password = '';
  String apiToken;
  String deviceToken;
  String phone ;
  String address;
  String bio;
  //Media image;
  String mobile = '';
  String referralCode;
  String confirmPassword ='';
  String dateOfBirth;
  //String zoneId;

  // used for indicate if client logged in or not
  bool auth;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap){
    id = jsonMap['id'].toString();
    name = jsonMap['name'] != null ? jsonMap['name'] : '';
    email = jsonMap['email'] != null ? jsonMap['email'] : '';
    mobile = jsonMap['mobile'] != null ? jsonMap['mobile'] : '';
    apiToken = jsonMap['api_token'];
    deviceToken = jsonMap['device_token'];
    referralCode=jsonMap['referral_code'].toString();
    dateOfBirth=jsonMap['dob'].toString();
    phone = jsonMap['phone'];
    address = jsonMap['address'];
    bio = jsonMap['bio'];
    //zoneId = jsonMap['zone_id'].toString() != null ? jsonMap['zone_id'].toString() : '';
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["mobile"]=mobile;
    map["referral_code"]=referralCode;
    map["email"] = email;
    map["name"] = name;
    map["password"] = password;
    map["api_token"] = apiToken;
    map['dob']=dateOfBirth.toString();
    if (deviceToken != null) {
      map["device_token"] = deviceToken;
    }
    map["phone"] = phone;
    map["address"] = address;
    map["bio"] = bio;
    //map["media"] = image?.toMap();
    return map;
  }

  Map duplicateACMap(){
    var map = new Map<String, dynamic>();
    map['phone_number']=mobile;
    return map;
  }

  Map resetPasswordMap(){
    var map = new Map<String, dynamic>();
    map['phone_number']=mobile;
    map["password"] = password;
    map['password_confirmation']=confirmPassword;
    return map;
  }
  bool profileCompleted() {
    return address != null && address != '' && phone != null && phone != '';
  }

}