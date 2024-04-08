import 'package:flutter/material.dart';
import 'package:graphs/waterfall/default_waterfall.dart';
import 'package:graphs/waterfall/vertical_waterfall.dart';

class WaterfallChart extends StatelessWidget {
  const WaterfallChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("SWaterfall Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Waterfall Chart",
                  ),
                  Tab(
                    text: "vertical Waterfall Chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultWaterfall(),
                VerticalWaterfall(),
              ],
            ),
          ),
        ));
  }
}
