$(function(){
    // const speech = new webkitSpeechRecognition();
  // speech.lang = 'ja-JP';
  // speech.continuous = true;
  // const start_btn = document.getElementById('start-btn');
  // const content = document.getElementById('content');


  // start_btn.addEventListener('click', function() {
  //     // 音声認識をスタート
  //     speech.start();
  // });

  // //音声自動文字起こし機能
  // speech.onresult = function(e) {
  //   speech.stop();
  //   if(e.results[0].isFinal){
  //       var autotext =  e.results[0][0].transcript
  //       console.log(e);
  //       console.log(autotext);
  //       document.getElementById('content').value = autotext
  //   }
  // }  


  // speech.onend = () => { 
  //   speech.start() 
  // };

  const startBtn = document.getElementById('start-btn');
  const stopBtn = document.getElementById('stop-btn');
  const resultDiv = document.getElementById('content');

  SpeechRecognition = webkitSpeechRecognition || SpeechRecognition;
  let recognition = new SpeechRecognition();

  recognition.lang = 'ja-JP';
  recognition.interimResults = true;
  recognition.continuous = true;

  let finalTranscript = ''; // 確定した(黒の)認識結果

  recognition.onresult = (event) => {
    let interimTranscript = ''; // 暫定(灰色)の認識結果
    for (let i = event.resultIndex; i < event.results.length; i++) {
      let transcript = event.results[i][0].transcript;
      console.log(event);
      console.log(transcript);
      if (event.results[i].isFinal) {
        finalTranscript += transcript;
      } else {
        interimTranscript = transcript;
      }
    }
    resultDiv.value = finalTranscript + interimTranscript 
  }
 

  startBtn.onclick = () => {
    recognition.start();
  }
  stopBtn.onclick = () => {
    recognition.stop();
  }
});