import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsCubit extends Cubit<Map<String, dynamic>> {
  ContactUsCubit() : super({
    "header": "Contact Us",
    "subText": "Say something to start a chat with us!",
    "phone": "0120 520 7376",
    "email": "acc.motharwat@gmail.com",
    "location": "Mansoura University",
  });
}
