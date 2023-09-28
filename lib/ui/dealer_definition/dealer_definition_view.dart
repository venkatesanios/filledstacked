import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dealer_definition/dealer_definition_viewmodel.dart';
import 'package:workspace/ui/dealer_definition/widgets/dealer_definition_tabview_widget.dart';
 

class DealerDefinitionView extends StatefulWidget {
  const DealerDefinitionView({super.key});

  @override
  State<DealerDefinitionView> createState() => _DealerDefinitionViewState();
}

class _DealerDefinitionViewState extends State<DealerDefinitionView> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DealerDefinitionViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Form(
          key: _formKey,
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Dealer Definition'),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: 'General',
                      icon: Icon(Icons.ac_unit),
                    ),
                    Tab(
                      text: 'Fertilizer',
                      icon: Icon(Icons.free_breakfast),
                    ),
                    Tab(
                      text: 'Valve default',
                      icon: Icon(Icons.file_download_rounded),
                    ),
                    Tab(
                      text: 'Memory',
                      icon: Icon(Icons.memory),
                    ),
                  ],
                ),
              ),
              body: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 70),
                child: TabBarView(
                  children: [
                    DealerDefinitionTabviewWidget(
                      tabTitle: 'General',
                      titleStatus: false,
                    ),
                    DealerDefinitionTabviewWidget(
                      tabTitle: 'Fertilizer',
                      titleStatus: false,
                    ),
                    DealerDefinitionTabviewWidget(
                      tabTitle: 'Filter',
                      titleStatus: false,
                    ),
                    DealerDefinitionTabviewWidget(
                      tabTitle: 'Memory',
                      titleStatus: false,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {},
                child: Icon(Icons.send),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
