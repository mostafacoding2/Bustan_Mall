import 'package:equatable/equatable.dart';

class ApplyFormModel extends Equatable {
  final int id;
  final String? businessName;
  final String? theDoorNumber;
  final String? businessPhone;
  final String? email;
  final String? country;
  final String? isbn;
  final String? idPhoto;
  final String? userId;

  const ApplyFormModel(
      {required this.id, required this.theDoorNumber, required this.country, required this.email, required this.userId, required this.businessName, required this.businessPhone, required this.idPhoto, required this.isbn});
 factory ApplyFormModel.fromJson(Map<String, dynamic> json)
 {
   return ApplyFormModel( id : json["id"],
  businessName : json["businessName"],
  theDoorNumber : json["theDoorNumber"],
  businessPhone : json["businessPhone"],
  email : json["email"],
  country : json["country"],
  isbn : json["isbn"],
  idPhoto : json["idPhoto"],
  userId : json["userId"]
   );

}
  @override
  List<Object?> get props =>
      [
        id,
        businessName,
        theDoorNumber,
        businessPhone,
        email,
        country,
        isbn,
        idPhoto,
        userId,
      ];
}