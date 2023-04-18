import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key? key}) : super(key: key);

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  bool isListening = false;
  String text = 'Hold the button and start speaking...';
  SpeechToText stt = SpeechToText();
  var snackBar = const SnackBar(
    duration: Duration(milliseconds: 1000),
    content: Text('Text Copied Successfully'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Speech Recognition'),
        leading: InkWell(
          onTap: ()async{
           await FlutterClipboard.copy(text).whenComplete(() {
             ScaffoldMessenger.of(context).showSnackBar(snackBar);
           });
          },
            child: const Icon(Icons.content_copy)),
      ),
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        glowColor: Colors.teal,
        duration: const Duration(milliseconds: 2000),
        child: GestureDetector(
          onTapDown: (v) async {
            if(isListening==false){
               await stt.initialize().then((value) {
                if(value){
                  setState(() {
                    isListening = true;
                    stt.listen(
                        onResult: (result){
                          setState(() {
                            text = result.recognizedWords;
                          });
                        }
                    );
                  });

                }
              });

            }

          },
          onTapUp: (v){
            stt.stop();
            setState(() {
              isListening = false;
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 30,
            child:  Icon(isListening ? Icons.mic : Icons.mic_none,color: isListening ?  Colors.red : Colors.white,size: 24,),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child:  Text(text,style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
        ),
      ),
    );
  }
}
