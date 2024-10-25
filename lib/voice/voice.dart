import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Voice extends StatefulWidget {
  // const Voice({Key? key}) : super(key: key);
  const Voice({super.key});

  @override
  VoiceState createState() => VoiceState();
}

class VoiceState extends State<Voice> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _recognizedWords = '';
  double confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      confidenceLevel = 0;
    });
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _recognizedWords = result.recognizedWords;
      confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Alexandria"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "You said...",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? "$_recognizedWords"
                      // If listening isn't active but could be tell the user
                      // how to start it, otherwise indicate that speech
                      // recognition is not yet ready or not supported on
                      // the target device
                      : _speechEnabled
                          ? "Tap the microphone to talk to Alex..."
                          : "Speech not available yet",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AvatarGlow(
        animate: !_speechToText.isNotListening,
        glowColor: const Color.fromARGB(255, 5, 61, 135),
        // endRadius: 60.0,
        child: Material(
          // Replace this child with your own
          elevation: 8.0,
          shape: const CircleBorder(),
          child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed:
                  // If not yet listening for speech start, otherwise stop
                  _speechToText.isNotListening ? _startListening : _stopListening,
              tooltip: "Listen",
              child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
            ),
          ),
        ),
    );
  }
}
