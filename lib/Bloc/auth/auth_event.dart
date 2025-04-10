abstract class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final String phoneNumber;
  SendOtpEvent(this.phoneNumber);
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;
  final String verificationId;

  VerifyOtpEvent(this.otp, this.verificationId);
}
