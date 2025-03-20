import 'package:agre_lens_app/shared/cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

  void toggleSystemUpdates(bool value) {
    emit(state.copyWith(systemUpdates: value));
  }

  void toggleBillReminder(bool value) {
    emit(state.copyWith(billReminder: value));
  }

  void togglePromotion(bool value) {
    emit(state.copyWith(promotion: value));
  }

  void toggleDiscount(bool value) {
    emit(state.copyWith(discount: value));
  }

  void togglePaymentRequest(bool value) {
    emit(state.copyWith(paymentRequest: value));
  }

  void toggleNewService(bool value) {
    emit(state.copyWith(newService: value));
  }

  void toggleNewTips(bool value) {
    emit(state.copyWith(newTips: value));
  }
}
