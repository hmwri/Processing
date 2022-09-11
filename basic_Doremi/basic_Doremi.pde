//basic_DoReMi.pde
//play doremi
//2022/06/27
//1-4-45 Taiyu Honma

// 音再生用のライブラリをロード
import ddf.minim.signals.*;
import ddf.minim.*;

// 音再生用
Minim minim;
AudioOutput out;
SineWave sine;

// 現在の音程を格納する変数を定義
// 1回目は0とするために初期値は-1とする
int currentToneID = -1;

float getFrequency( int naturalToneID )
{
  float oc = pow(2,floor(naturalToneID/7));
  println(oc);
 switch(naturalToneID%7){
   case 0:
     return 261.6f * oc;
   case 1:
     return 293.7f * oc;
   case 2:
     return 329.6f * oc;
   case 3:
     return 349.2f * oc;
   case 4:
     return 392.0f * oc;
   case 5:
     return 440.0f * oc;
   default:
     return 493.9f * oc;
 }
}

void setup() {
  // ウインドウサイズは適当
  // 現在の音程を表示するプログラムに変更しても良いですよ
  size(150, 150);
  
  // 音再生のための準備  
  minim = new Minim( this );
  out = minim.getLineOut( Minim.STEREO );
  sine = new SineWave( 0, 0.5, out.sampleRate() );
  out.addSignal( sine );
}

void draw() {
}

void stop(){
  out.clearSignals();
  minim.stop();
}

void keyPressed() {
  if ( keyCode == UP ) {
    currentToneID ++;
    sine.setFreq( getFrequency( currentToneID ) );
  } else if ( keyCode == DOWN ) {
    currentToneID --; 
    if( currentToneID < 0 ){
      currentToneID = 0;
    }   
    sine.setFreq( getFrequency( currentToneID ) );
  }
}
