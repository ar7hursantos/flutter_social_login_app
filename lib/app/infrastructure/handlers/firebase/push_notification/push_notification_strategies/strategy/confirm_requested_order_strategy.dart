import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'i_push_strategy.dart';

class ConfirmRequestedOrderStrategy implements IPushStrategy {
  final String specificSchoolSubjectName;
  final String virtualClassRequestOrderId;
  final String virtualClassAcceptanceOrderId;
  final String durationLabel;

  ConfirmRequestedOrderStrategy({
    @required this.specificSchoolSubjectName,
    @required this.virtualClassRequestOrderId,
    @required this.virtualClassAcceptanceOrderId,
    this.durationLabel,
  });

  @override
  void execute(Map<String, dynamic> pushPayload) {
    Modular.to
        .pushReplacementNamed('/virtual_class/requested_order/', arguments: {
      'specificSchoolSubjectName': specificSchoolSubjectName,
      'virtualClassRequestOrderId': virtualClassRequestOrderId,
      'virtualClassAcceptanceOrderId': virtualClassAcceptanceOrderId,
      'durationLabel': durationLabel,
    });
  }
}
