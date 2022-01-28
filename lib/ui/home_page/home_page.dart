import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:water_jug_challenge/ui/dumb_widgets/jug_widget.dart';
import 'package:water_jug_challenge/ui/home_page/home_page_viewmodel.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewmodel>.reactive(
      viewModelBuilder: HomePageViewmodel.new,
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TextFormField(
                    controller: model.xController,
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: model.yController,
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: model.zController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            if (model.isSolved == null)
              const SliverToBoxAdapter(
                child: Text('Enter any input for X, Y, Z and see the solution'),
              ),
            if (model.isSolved != null && !model.isSolved!)
              const SliverToBoxAdapter(
                child: Text('No Solution'),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == 0) {
                      return Text('Solved! ${model.stepList.length} Steps:');
                    }

                    return Row(
                      children: [
                        JugWidget(
                          maxVolume: model.xJugVol!,
                          currenVolume: model.stepList[index].fromJugVolume,
                          name: model.stepList[index].fromJug,
                        ),
                        JugWidget(
                          maxVolume: model.yJugVol!,
                          currenVolume: model.stepList[index].toJugVolume,
                          name: model.stepList[index].toJug,
                        ),
                        Text(model.stepList[index].explanation),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
