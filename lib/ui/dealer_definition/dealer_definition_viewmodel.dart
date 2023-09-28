import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/dealer_definition_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

class DealerDefinitionViewModel extends BaseViewModel with NavigationMixin {
  DealerDefinitionViewModel() {getDealerDefinition();}

  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();

  List<Fertilizer> get generalList => DealerDefinitionResponse.fromJson(responsejson).general ?? [];
  List<Fertilizer> get fertilizerList => DealerDefinitionResponse.fromJson(responsejson).fertilizer ?? [];
  List<Fertilizer> get valveList => DealerDefinitionResponse.fromJson(responsejson).valve ?? [];
  List<Fertilizer> get memorylist => DealerDefinitionResponse.fromJson(responsejson).memory ?? [];

  Future<void> getDealerDefinition() async {
    final dealerDefinitionResponse = await _apiService.getDealerDefinition(DealerDefinitionRequest(active: null));
    print(dealerDefinitionResponse);
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(title: "Message", description: message);
  }

  final responsejson = {
    "message": "Succès ",
    "code": 200,
    "General": [
      {"title": "USA. unite", "description": "Details of use Use units", "value": "1234", "valuetype": "1", "dropdownlist": []},
      {"title": "USA. unite", "description": "Details of use Use units2", "value": "1234", "valuetype": "dropdown", "dropdownlist": []}
    ],
    "Fertilizer": [
      {"title": "Fertilizer", "description": "Details of use Use units", "value": "1234", "valuetype": "2", "dropdownlist": []}
    ],
    "Valve": [
      {"title": "Valve", "description": "Details of use Use units", "value": "1234", "valuetype": "3", "dropdownlist": []}
    ],
    "Memory": [
      {"title": "Memory", "description": "Details of use Use units", "value": "1234", "valuetype": "1", "dropdownlist": []},
      {"title": "Memory", "description": "Details of use Use units", "value": "1234", "valuetype": "2", "dropdownlist": []},
      {"title": "Memory", "description": "Details of use Use units", "value": "1234", "valuetype": "2", "dropdownlist": []},
    ]
  };
}
