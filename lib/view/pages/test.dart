import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:haddithny/core/constant/imageasset.dart';

class Test extends StatefulWidget {
  const Test({super.key});


  @override
  State<StatefulWidget> createState(){
    return _TestState();
  }
}

class _TestState extends State<Test>{

 @override
    Widget build(BuildContext context){
      
    return   Scaffold(
      body: Center(

        child: Column(
          children: [
            const ImageIcon(AssetImage(AppImageAsset.timer)),
           
            ElevatedButton(
              onPressed: (){
                 AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audio/tt.mp3"),
    autoStart: true,
    showNotification: true,
);
              },
              child: const Text("hi"),),
          ],
        ),
        ),
     
      
    );
  

    }}