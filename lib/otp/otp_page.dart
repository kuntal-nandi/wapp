import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key, required this.fieldNo}) : super(key: key);
  final int fieldNo;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  initState() {
    super.initState();
    for(var i=0; i<widget.fieldNo; i++){
      controllers.add(TextEditingController());
      fNode.add(FocusScopeNode());
    }

  }
  List<FocusScopeNode> fNode = [];
  List<TextEditingController> controllers = [];
  final FocusScopeNode _focusScopeNode = FocusScopeNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.fieldNo; i++)
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 30,
                child: Focus(
                  autofocus: true,
                  canRequestFocus: true,
                  child: RawKeyboardListener(
                    focusNode: fNode[i],
                    onKey: (RawKeyEvent event){
                      if(event.logicalKey.keyLabel=="Backspace"){
                          //_focusScopeNode.previousFocus();
                        fNode[i!=0?i-1:0].requestFocus();
                      }
                    },
                    child: TextFormField(
                      autofocus: true,
                      textInputAction: i<widget.fieldNo-1?TextInputAction.next:TextInputAction.go,
                      onChanged: (v){
                        if(v.isNotEmpty){
                          if(i<widget.fieldNo-1){
                            fNode[i+1].nextFocus();
                          }
                        }else{
                          if(i>0){
                           fNode[i!=0?i-1:0].requestFocus();
                          }
                        }
                      },
                      controller: controllers[i],
                      maxLength:1,
                      textAlign: TextAlign.center,
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        counterText: '',
                        focusedBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 2, color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 2, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
