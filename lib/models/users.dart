class Users{
  String fName;
  String sName;
  String email;
  String age;
  String height;
  String weight;
  String gender;
  Users(this.fName, this.sName, this.email, this.age, this.height, this.weight,this.gender);

  Map<String,dynamic>toJson(){
    return {
      "firstName":fName,
      "secondName":sName,
      "email":email,
      "age":age,
      "height":height,
      "weight":weight,
      "gender":gender
    };
  }
}