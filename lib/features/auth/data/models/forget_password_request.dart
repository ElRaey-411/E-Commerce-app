class ForgetPasswordRequest {

 const ForgetPasswordRequest({
     this.email,
     this.resetCode,
     this.newPassword,
});
  final String? email;
  final String? resetCode;
  final String? newPassword;

  Map<String, dynamic> emailToJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
 Map<String, dynamic> resetCodeToJson() {
   final map = <String, dynamic>{};
   map['resetCode'] = resetCode;
   return map;
 }

 Map<String, dynamic> resetPasswordToJson() {
   final map = <String, dynamic>{};
   map['email'] = email;
   map['newPassword'] = newPassword;
   return map;
 }
}