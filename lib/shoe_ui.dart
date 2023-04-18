import 'package:flutter/material.dart';
import 'package:wapp/animation_play.dart';
import 'dart:ui' as ui;

import 'package:wapp/newPage.dart';
import 'package:wapp/voice/voice_to_speech.dart';

class ShoeList extends StatelessWidget {
  ShoeList({Key? key}) : super(key: key);

  final List<Widget> images = [
    Image.asset('images/shoe1.png',width: 120),
    Image.asset('images/shoe2.png',width: 120),
    Image.asset('images/shoe3.png',width: 120),
    Image.asset('images/shoe4.png',width: 120),
    Image.asset('images/shoe5.png',width: 120),
    Image.asset('images/shoe6.png',width: 120),
  ];
  final double _width=500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffe6cda2),
        centerTitle: true,
        title: const Text(
          "Gucci Store",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Stack(
              fit: StackFit.loose,
              children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color(0xffFED8B1),
                            Color(0xffFED8B1),
                            Colors.white,
                          ])
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Color(0xffFED8B1),
                                Color(0xffFED8B1),
                                Colors.white,
                              ])
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle, color: const Color(0xffFFDAB9).withOpacity(0.4),
                            border: Border.all(width: 25, color: const Color(0xffFFDAB9),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                Positioned(
                  left: 108,
                  top: 100,
                    child: SizedBox(
                      width: 140,
                      height: 120,
                      child: ListView.builder(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: images.length,
                        itemBuilder: (context, i){
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: images[i],
                          );
                        },
                      ),
                    )
                ),
                Positioned(
                  left: 148,
                  top: 15,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AnimationPlay()),);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff77BFC7).withOpacity(0.6)
                      ),
                      child: const Text('30%',style: TextStyle(fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
            ],),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewGradient()),);
              },
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                    gradient: SweepGradient(
                      stops: const [
                        0.2,
                        0.4,
                        0.6,
                        1.0
                      ],
                      colors: [
                        Colors.red.withOpacity(0.3),
                        Colors.blueAccent.withOpacity(0.4),
                        Colors.orange,
                        Colors.greenAccent.withOpacity(0.4)
                      ],
                      tileMode: TileMode.mirror,
                    )
                ),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(color: Colors.black87,shape: BoxShape.circle),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const VoiceAssistant()),);
              },
              child: const Text("voice assistant",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            // CustomPaint(
            //   size: Size(200,(200*0.5833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //   painter: SCustomPainter(),
            // ),
            // CustomPaint(
            //   size: Size(500,(500*0.5833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //   painter: SCustomPainter(),
            // ),


            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     CustomPaint(
            //     size: Size(WIDTH,(WIDTH*0.5833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //     painter: SwimPainter(),
            //   ),
            //     Positioned(
            //       top: 52,
            //       left: 85,
            //         child: Container(height: 10,width: 10,color: Colors.white,)),
            //   ]
            // ),

            // Stack(
            //   children: [
            //     const Positioned(
            //       top: 92,
            //       left: 208,
            //       child: CircleAvatar(
            //         radius: 12,
            //         backgroundColor:Colors.black,
            //       ),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.only(left: 70),
            //       child: CustomPaint(
            //       size: Size(_width,(_width*0.5833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //       painter: BatMan(),
            //
            //   ),
            //     ),]
            // ),
          ],
        ),
      ),
    );
  }
}

// class RPSCustomPainter extends CustomPainter{
//
//   @override
//   void paint(Canvas canvas, Size size) {
//
//
//
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 4;
//
//
//     Path path0 = Path();
//     path0.moveTo(size.width*0.4187167,size.height*0.3608143);
//     path0.quadraticBezierTo(size.width*0.4837167,size.height*0.3586714,size.width*0.5841667,size.height*0.2114286);
//     path0.lineTo(size.width*0.5825000,size.height*0.2871429);
//     path0.lineTo(size.width*0.5522000,size.height*0.3899429);
//     path0.lineTo(size.width*0.5174583,size.height*0.4514000);
//     path0.lineTo(size.width*0.4633333,size.height*0.4885714);
//     path0.lineTo(size.width*0.4175000,size.height*0.5018429);
//     path0.lineTo(size.width*0.3378333,size.height*0.4965286);
//     path0.lineTo(size.width*0.2933917,size.height*0.3599286);
//     path0.lineTo(size.width*0.3325000,size.height*0.2142857);
//     path0.lineTo(size.width*0.3736750,size.height*0.1420286);
//     path0.lineTo(size.width*0.4170167,size.height*0.0734429);
//     path0.quadraticBezierTo(size.width*0.3899667,size.height*0.3093857,size.width*0.4187167,size.height*0.3608143);
//     path0.close();
//
//     canvas.drawPath(path0, paint0);
//
//
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
// }

// class SCustomPainter extends CustomPainter{
//
//   @override
//   void paint(Canvas canvas, Size size) {
//
//
//
//     Paint paint0 = Paint()
//       ..color = Colors.green
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
//
//
//     Path path0 = Path();
//     path0.moveTo(size.width*0.2066667,size.height*0.6400000);
//     path0.quadraticBezierTo(size.width*0.6435417,size.height*0.6421429,size.width*0.7891667,size.height*0.6428571);
//     path0.quadraticBezierTo(size.width*0.6311750,size.height*0.5488857,size.width*0.7900000,size.height*0.4314286);
//     path0.cubicTo(size.width*0.7381250,size.height*0.4300000,size.width*0.6343750,size.height*0.4271429,size.width*0.5825000,size.height*0.4257143);
//     path0.quadraticBezierTo(size.width*0.5694250,size.height*0.5009429,size.width*0.4991667,size.height*0.4985714);
//     path0.quadraticBezierTo(size.width*0.4225250,size.height*0.4937143,size.width*0.4191583,size.height*0.4261857);
//     path0.quadraticBezierTo(size.width*0.3654104,size.height*0.4260679,size.width*0.2041667,size.height*0.4257143);
//     path0.quadraticBezierTo(size.width*0.3723000,size.height*0.5610143,size.width*0.2066667,size.height*0.6400000);
//     path0.close();
//
//     canvas.drawPath(path0, paint0);
//
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
// }
//
//
// class SwimPainter extends CustomPainter{
//
//   @override
//   void paint(Canvas canvas, Size size) {
//
//
//
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 221, 226, 231)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
//     paint0.shader = ui.Gradient.linear(Offset(size.width*0.20,size.height*0.25),Offset(size.width*0.79,size.height*0.25),[const Color(0xff1589FF),const Color(0xff43BFC7)],[0.00,1.00]);
//
//     Path path0 = Path();
//     path0.moveTo(size.width*0.2058333,size.height*0.4971429);
//     path0.lineTo(size.width*0.7908333,size.height*0.4985714);
//     path0.quadraticBezierTo(size.width*0.7920833,size.height*0.2853571,size.width*0.7925000,size.height*0.2142857);
//     path0.cubicTo(size.width*0.6622333,size.height*-0.0998143,size.width*0.4554417,size.height*0.5934000,size.width*0.2052833,size.height*0.2128857);
//     path0.cubicTo(size.width*0.2045875,size.height*0.2110929,size.width*0.2031958,size.height*0.2075071,size.width*0.2025000,size.height*0.2057143);
//     path0.quadraticBezierTo(size.width*0.2025000,size.height*0.2042857,size.width*0.2025000,size.height*0.2000000);
//     path0.lineTo(size.width*0.2025000,size.height*0.2085714);
//     path0.lineTo(size.width*0.2000000,size.height*0.1942857);
//     path0.lineTo(size.width*0.2058333,size.height*0.2057143);
//
//     canvas.drawPath(path0, paint0);
//
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
// }
class BatMan extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 221, 226, 231)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..shader = ui.Gradient.linear(
        const Offset(100,100),
        const Offset(150,150),
        [
          Colors.red,
          Colors.green,
        ],
      );

    //paint0.shader = ui.Gradient.linear(Offset(size.width*0.62,size.height*0.35),Offset(size.width*0.42,size.height*0.21),[const Color(0xffC88141),const Color(0xff808000)],[0.00,1.00]);

    Path path0 = Path();
    path0.moveTo(size.width*0.2091667,size.height*0.2142857);
    path0.quadraticBezierTo(size.width*0.3338250,size.height*0.2853286,size.width*0.3325000,size.height*0.3571429);
    path0.cubicTo(size.width*0.3529167,size.height*0.3914286,size.width*0.3871000,size.height*0.4067714,size.width*0.4141667,size.height*0.4942857);
    path0.quadraticBezierTo(size.width*0.4480917,size.height*0.4132143,size.width*0.4566583,size.height*0.4285857);
    path0.quadraticBezierTo(size.width*0.4885396,size.height*0.3707179,size.width*0.4991667,size.height*0.3514286);
    path0.quadraticBezierTo(size.width*0.4915833,size.height*0.2955143,size.width*0.6241667,size.height*0.2114286);
    path0.lineTo(size.width*0.4575000,size.height*0.2828571);
    path0.quadraticBezierTo(size.width*0.4568750,size.height*0.3375000,size.width*0.4566667,size.height*0.3557143);
    path0.quadraticBezierTo(size.width*0.4575500,size.height*0.4104000,size.width*0.4158333,size.height*0.4300000);
    path0.quadraticBezierTo(size.width*0.3750833,size.height*0.4074429,size.width*0.3733333,size.height*0.3542857);
    path0.quadraticBezierTo(size.width*0.3735417,size.height*0.3371429,size.width*0.3741667,size.height*0.2857143);
    path0.lineTo(size.width*0.2091667,size.height*0.2142857);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}