class UserModel{
  String email;
  String name;
  String phone;
  String uId;
  String image;
  String cover;
  String age;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.image,
    this.cover,
    this.age,
  });

  UserModel.fromJson(Map<String ,dynamic> json){
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uId=json['uId'];
    image=json['image'];
    cover=json['cover'];
    age=json['age'];
  }
  Map<String , dynamic> toMap(){
    return{
      'email':email,
      'name':name,
      'phone':phone,
      'uId':uId,
      'image':image,
      'cover':cover,
      'age':age,
    };
  }
}