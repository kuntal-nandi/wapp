import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({Key? key}) : super(key: key);

  @override
  State<LottieAnimationPage> createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage>
    with SingleTickerProviderStateMixin {
   late AnimationController _animationController;
  @override
  void initState(){
    _animationController = AnimationController(vsync: this,
        duration: const Duration(seconds: 3));
    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xffDC143C),
        title: const Text('Pizza Hub'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network('https://assets3.lottiefiles.com/packages/lf20_6sxyjyjj.json',
                width: double.infinity,fit: BoxFit.fitWidth,animate: true),
            const SizedBox(height: 30,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(fontSize: 28,wordSpacing: 2,fontWeight: FontWeight.w600),
                backgroundColor: const Color(0xffDC143C)
              ),
                onPressed: orderPlacedDialog,
                icon: const Icon(Icons.delivery_dining,size: 32,),
                label: const Text('Order Pizza'))
          ],
        ),
      ),
    );
  }
  void orderPlacedDialog()=> showDialog(context: context,
      builder: (context)=>Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('images/done.json',repeat: false,
                controller: _animationController,
              onLoaded: (composition){
              _animationController.forward();
              }
            ),
            const Text('Order Placed Successfully',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xff12AD2B)
            ),),
            const SizedBox(height: 15,),
          ],
        ),
      ));
}


