import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:water_jug_challenge/models/enums/enums.dart';
import 'package:water_jug_challenge/ui/dumb_widgets/jug_widget.dart';
import 'package:water_jug_challenge/ui/home_page/home_page_viewmodel.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewmodel>.reactive(
      viewModelBuilder: HomePageViewmodel.new,
      builder: (context, model, child) {
        final headline4 = Theme.of(context).textTheme.headline4;
        final headline6 = Theme.of(context).textTheme.headline6;
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Enter any input for X, Y, Z and see the solution',
                      style: headline6,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: model.xController,
                          //use tests for bigger integers
                          maxLength: 7,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text('X: '),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: model.yController,
                          maxLength: 7,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text('Y: '),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: model.zController,
                          maxLength: 7,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text('Z: '),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        model.solve(context);
                      },
                      child: const Text('Solve'),
                    ),
                  ),
                ),
                if (model.isSolved != null && !model.isSolved!)
                  SliverToBoxAdapter(
                    child: Text(
                      'No Solution',
                      style: headline4,
                      textAlign: TextAlign.center,
                    ),
                  )
                else if (model.isSolved != null && model.isSolved!)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == 0) {
                          return Center(
                            child: Text(
                              'Solved! ${model.stepList.length} Steps:',
                              style: headline4,
                            ),
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: JugWidget(
                                maxVolume: model.stepList[index - 1].fromJugMax,
                                currentVolume:
                                    model.stepList[index - 1].fromJugVolume,
                                name: model.stepList[index - 1].action ==
                                        WaterAction.fill
                                    ? 'Ocean'
                                    : '',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: JugWidget(
                                maxVolume: model.stepList[index - 1].toJugMax,
                                currentVolume:
                                    model.stepList[index - 1].toJugVolume,
                                name: model.stepList[index - 1].action ==
                                        WaterAction.empty
                                    ? 'Ocean'
                                    : '',
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  model.stepList[index - 1].explanation,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      childCount: model.stepList.length + 1,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
