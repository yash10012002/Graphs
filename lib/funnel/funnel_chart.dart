import 'package:flutter/material.dart';
import 'package:graphs/funnel/datalabbel_funnel.dart';
import 'package:graphs/funnel/default_funnel_chart.dart';

class FunnelChart extends StatelessWidget {
  const FunnelChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Funnel Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Funnel Chart",
                  ),
                  Tab(
                    text: "Data label",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultFunnelChart(),
                DataLabelFunnel(),
              ],
            ),
          ),
        ));
  }
}
