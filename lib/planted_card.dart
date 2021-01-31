import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PlantedCard extends StatefulWidget{

  final String plant;
  final int progress;
  final int maxProgress;

  const PlantedCard({
    Key key,
    this.plant,
    this.progress,
    this.maxProgress
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlantedCardState(plant, progress, maxProgress);

}

class _PlantedCardState extends State<PlantedCard> {
  String plant;
  int progress;
  int maxProgress;

  _PlantedCardState(String plant, int progress, int maxProgress);

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(new Radius.circular(18))
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: [
            Center(
              child: new Text(widget.plant, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),),
            ),
            SizedBox(height: 6,),
            Center(
              child: CircularPercentIndicator(
                radius: 160,
                lineWidth: 8,
                percent: widget.progress/widget.maxProgress,
                center: Icon(
                  Icons.local_florist_rounded,
                  size: 100,
                  color: Colors.green,
                ),
                progressColor: Colors.green,
              )
            ),
            SizedBox(height: 4,),
            Center(
              child: Text(
                "12 días restantes para trasplantar"
              ),
            ),
            SizedBox(height: 6,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Estado actual",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
            SizedBox(height: 6,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ahora las raíces deben haber crecido entre 2 y 3 centímetros. El tallo empieza a sobresalir de la tierra.",
              ),
            ),
            SizedBox(height: 6,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    child: Row(
                      children: [
                        Icon(Icons.info, color: Colors.green,),
                        SizedBox(width: 6,),
                        Text("Información", style: TextStyle(color: Colors.green),)
                      ],
                    ),
                    color: Colors.white,
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "Trasplantar!",
                      style: TextStyle(color: Colors.green),
                    ),
                    color: Colors.white,
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}