  import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:haddithny/core/constant/audioasset.dart';


playsound(sound){
         AssetsAudioPlayer.newPlayer().open(
    Audio(sound),
    autoStart: true,
    showNotification: false,
);
  }


AssetsAudioPlayer backplayer =  AssetsAudioPlayer.newPlayer();

  playBackSound(){
    backplayer.open(
    Audio(AppAudioAsset.background),
    autoStart: true,
    showNotification: false,
    loopMode: LoopMode.single
);



  }

  stopBackSound(){
  backplayer.stop();
}

AssetsAudioPlayer timerplayer =  AssetsAudioPlayer.newPlayer();

  playTimerSound(t){
    timerplayer.open(
    Audio(t),
    autoStart: true,
    showNotification: false,
);



  }

  stopTimerSound(){
  timerplayer.stop();
}