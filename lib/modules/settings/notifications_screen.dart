import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agre_lens_app/shared/cubit/notification_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              NotificationSection(
                title: 'System & services update',
                notifications: [
                  NotificationItem(
                    label: 'App updates',
                    toggleCallback: (context, value) => context
                        .read<NotificationCubit>()
                        .toggleSystemUpdates(value),
                    toggleSelector: (state) => state.systemUpdates,
                  ),
                  NotificationItem(
                    label: 'Bill Reminder',
                    toggleCallback: (context, value) => context
                        .read<NotificationCubit>()
                        .toggleBillReminder(value),
                    toggleSelector: (state) => state.billReminder,
                  ),
                  NotificationItem(
                    label: 'Promotion',
                    toggleCallback: (context, value) => context
                        .read<NotificationCubit>()
                        .togglePromotion(value),
                    toggleSelector: (state) => state.promotion,
                  ),
                  NotificationItem(
                    label: 'Discount Available',
                    toggleCallback: (context, value) =>
                        context.read<NotificationCubit>().toggleDiscount(value),
                    toggleSelector: (state) => state.discount,
                  ),
                  NotificationItem(
                    label: 'Payment Request',
                    toggleCallback: (context, value) => context
                        .read<NotificationCubit>()
                        .togglePaymentRequest(value),
                    toggleSelector: (state) => state.paymentRequest,
                  ),
                ],
              ),
              SizedBox(height: 20),
              NotificationSection(
                title: 'Others',
                notifications: [
                  NotificationItem(
                    label: 'New Service Available',
                    toggleCallback: (context, value) => context
                        .read<NotificationCubit>()
                        .toggleNewService(value),
                    toggleSelector: (state) => state.newService,
                  ),
                  NotificationItem(
                    label: 'New Tips Available',
                    toggleCallback: (context, value) =>
                        context.read<NotificationCubit>().toggleNewTips(value),
                    toggleSelector: (state) => state.newTips,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final List<NotificationItem> notifications;

  const NotificationSection({
    Key? key,
    required this.title,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Column(
            children: [
              for (int i = 0; i < notifications.length; i++) ...[
                notifications[i],
                if (i != notifications.length - 1)
                  Divider(thickness: 1, color: Color(0xFFEEEEEE)),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String label;
  final Function(BuildContext, bool) toggleCallback;
  final bool Function(NotificationState) toggleSelector;

  const NotificationItem({
    Key? key,
    required this.label,
    required this.toggleCallback,
    required this.toggleSelector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Transform.scale(
                scale: 1,
                child: SizedBox(
                  width: 40,
                  height: 20,
                  child: Switch(
                    value: toggleSelector(state),
                    onChanged: (value) => toggleCallback(context, value),
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xFF4CAF50),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade400,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
