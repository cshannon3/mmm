import 'package:flutter/widgets.dart';

class CountsWidget extends StatelessWidget {
  final double w;

  const CountsWidget({Key key, this.w}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return    SliverList(
              delegate: SliverChildListDelegate(
              w>600.0?  [
        Container(
          height: 120.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                countWidget(name: "Hand-Sewn Masks", quantity: "25,000+"),
                countWidget(name: "Face Shields", quantity: "300+"),
                countWidget(name: "Ear Savers", quantity: "1500+"),
                countWidget(name: "Bias Tape Makers", quantity: "300+"),
              ],
            ),
          ),
        )
      ]: [
      Container(
        height: 120.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              countWidget(name: "Hand-Sewn Masks", quantity: "25,000+"),
              countWidget(name: "Face Shields", quantity: "300+"),
            ],
          ),
        ),
      ),
      Container(
        height: 120.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              countWidget(name: "Ear Savers", quantity: "1500+"),
              countWidget(name: "Bias Tape Makers", quantity: "300+"),
            ],
          ),
        ),
      )
    ])
    );
  }
}


Widget countWidget({String quantity, String name}) => Container(
        child: Column(
      children: <Widget>[
        Text(
          quantity,
          style: TextStyle(fontSize: 50.0),
        ),
        Text(name),
        Text("Produced")
      ],
    ));
