class User{
  int id;
  String name;
  String email;
  String password;

  factory User(Map jsonMap){
   try{
    return User.deserialize(jsonMap);  
   }catch(ex){
     throw ex;
   }   
  }

  User.deserialize(Map json) :
  id = json["id"].toInt(),
  name = json["name"],
  email = json["email"],
  password = json["password"];
}