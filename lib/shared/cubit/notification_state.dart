part of 'notification_cubit.dart';

class NotificationState {
  final bool generalNotification;
  final bool sound;
  final bool vibrate;
  final bool systemUpdates;
  final bool billReminder;
  final bool promotion;
  final bool discountAvailable;
  final bool paymentRequest;
  final bool serviceUpdates;
  final bool newServiceAvailable;
  final bool newTipsAvailable;

  const NotificationState({
    this.generalNotification = false,
    this.sound = false,
    this.vibrate = false,
    this.systemUpdates = false,
    this.billReminder = false,
    this.promotion = false,
    this.discountAvailable = false,
    this.paymentRequest = false,
    this.serviceUpdates = false,
    this.newServiceAvailable = false,
    this.newTipsAvailable = false,
  });

  NotificationState copyWith({
    bool? generalNotification,
    bool? sound,
    bool? vibrate,
    bool? systemUpdates,
    bool? billReminder,
    bool? promotion,
    bool? discountAvailable,
    bool? paymentRequest,
    bool? serviceUpdates,
    bool? newServiceAvailable,
    bool? newTipsAvailable,
  }) {
    return NotificationState(
      generalNotification: generalNotification ?? this.generalNotification,
      sound: sound ?? this.sound,
      vibrate: vibrate ?? this.vibrate,
      systemUpdates: systemUpdates ?? this.systemUpdates,
      billReminder: billReminder ?? this.billReminder,
      promotion: promotion ?? this.promotion,
      discountAvailable: discountAvailable ?? this.discountAvailable,
      paymentRequest: paymentRequest ?? this.paymentRequest,
      serviceUpdates: serviceUpdates ?? this.serviceUpdates,
      newServiceAvailable: newServiceAvailable ?? this.newServiceAvailable,
      newTipsAvailable: newTipsAvailable ?? this.newTipsAvailable,
    );
  }

  @override
  List<Object?> get props => [
        generalNotification,
        sound,
        vibrate,
        systemUpdates,
        billReminder,
        promotion,
        discountAvailable,
        paymentRequest,
        serviceUpdates,
        newServiceAvailable,
        newTipsAvailable,
      ];
}
