import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/models/dealer_definition_model.dart';
import 'package:workspace/ui/dealer_definition/dealer_definition_viewmodel.dart';
import 'package:workspace/ui/widgets/custom_switch.dart';
import 'package:workspace/ui/widgets/custom_text.dart';
import 'package:workspace/ui/widgets/drop_down_button.dart';

class DealerDefinitionTabviewWidget extends ViewModelWidget<DealerDefinitionViewModel> {
  const DealerDefinitionTabviewWidget({
    super.key,
    required this.tabTitle,
    required this.titleStatus,
  });
  final String tabTitle;
  final bool titleStatus;

  @override
  Widget build(BuildContext context, DealerDefinitionViewModel viewModel) {
    int count = 0;
    int oddeven = 0;
    List<Fertilizer> Listofvalue = [];
    if (tabTitle == "General") {
      count = viewModel.generalList.length;
      Listofvalue = viewModel.generalList;
    } else if (tabTitle == "Fertilizer") {
      count = viewModel.fertilizerList.length;
      Listofvalue = viewModel.fertilizerList;
    } else if (tabTitle == "Filter") {
      count = viewModel.valveList.length;
      Listofvalue = viewModel.valveList;
    } else if (tabTitle == "Memory") {
      count = viewModel.memorylist.length;
      Listofvalue = viewModel.memorylist;
    }
    return Column(
      children: [
        titleStatus
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  tabTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Container(),
        Flexible(
          child: ListView.builder(
            itemCount: Listofvalue.length,
            itemBuilder: (context, index) {
              oddeven = index.isEven ? 0 : 1;
              if (Listofvalue[index].valuetype == '1') {
                String selectedDropdownValue = 'hh:mm:ss';
                return Column(
                  children: [
                    Container(
                      child: ListTile(
                        //   leading: const Icon(Icons.account_balance),
                        title: Text('${Listofvalue[index].title}'),
                        subtitle: Text(
                          'Details: ${Listofvalue[index].title}',
                          style: const TextStyle(fontSize: 11),
                        ),
                        trailing: Container(
                          color: Colors.white,
                          width: 80,
                          child: MyDropDown(
                            itemList: const [
                              '--/--',
                              'hh:mm:ss',
                              'm3',
                              'Model 3',
                            ],
                            // setValue: viewModel.updatevalue,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 70,
                      ),
                      child: Divider(
                        height: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              } else if (Listofvalue[index].valuetype == '2') {
                return Column(
                  children: [
                    Container(
                      child: ListTile(
                        title: Text('${Listofvalue[index].title}'),
                        subtitle: Text(
                          'Details: ${Listofvalue[index].title}',
                          style: const TextStyle(fontSize: 11),
                        ),
                        trailing: SizedBox(
                            width: 50,
                            child: CustomTextField(
                              onChanged: (text) {},
                              initialValue: '${Listofvalue[index].valuetype}',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Warranty is required';
                                } else {
                                  // viewModel.updatevalue;
                                }
                                return null;
                              },
                            )),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 70,
                      ),
                      child: Divider(
                        height: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Container(
                      child: ListTile(
                        title: Text('${Listofvalue[index].title}'),
                        subtitle: Text(
                          'Details: ${Listofvalue[index].title}',
                          style: const TextStyle(fontSize: 11),
                        ),
                        trailing: MySwitch(
                          value: false,
                          onChanged: ((value) {
                            print(value);
                            // viewModel.updatevalue;
                          }),
                        ),
                        // trailing: Switch(
                        //   value: false,
                        //   onChanged: (value) {},
                        // ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 70,
                      ),
                      child: Divider(
                        height: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
