import 'strategy/confirm_requested_order_strategy.dart';
import 'strategy/i_push_strategy.dart';

class PushNotificationFactory {
  Map<String, dynamic> pushPayload;
  IPushStrategy strategy;

  PushNotificationFactory.create(this.pushPayload) {
    switch (pushPayload['action']) {
      case 'confirmClassRequest':
        strategy = ConfirmRequestedOrderStrategy(
          specificSchoolSubjectName:
              pushPayload['specific_school_subject_name'],
          virtualClassRequestOrderId:
              pushPayload['virtual_class_request_order_id'],
          virtualClassAcceptanceOrderId:
              pushPayload['virtual_class_acceptance_order_id'],
          durationLabel: pushPayload['duration_label'],
        );
        break;
      default:
        throw Exception('Estratégia Não implementada');
    }
  }

  void execute() {
    strategy.execute(pushPayload);
  }
}
