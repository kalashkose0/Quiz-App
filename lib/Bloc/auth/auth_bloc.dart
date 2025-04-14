import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+91${event.phoneNumber}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
            emit(AuthLoadedState());
          },
          verificationFailed: (FirebaseAuthException e) {
            emit(AuthErrorState(e.message ?? "Verification failed"));
          },
          codeSent: (String verificationId, int? resendToken) {
            emit(OtpSentState(verificationId));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoadedState());
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId,
          smsCode: event.otp,
        );

        await _firebaseAuth.signInWithCredential(credential);
        emit(AuthLoadedState());
      } catch (e) {
        emit(AuthErrorState("Invalid OTP"));
      }
    });
  }
}
