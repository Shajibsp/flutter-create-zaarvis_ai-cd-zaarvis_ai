import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zaarvis AI',
      home: const ZaarvisHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ZaarvisHome extends StatefulWidget {
  const ZaarvisHome({super.key});
  @override
  State<ZaarvisHome> createState() => _ZaarvisHomeState();
}

class _ZaarvisHomeState extends State<ZaarvisHome> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts();

  bool _isListening = false;
  String _userSpeech = '';
  String _response = '';

  Future<void> _listen() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(onResult: (result) {
        setState(() {
          _userSpeech = result.recognizedWords;
        });
        _getAIResponse(_userSpeech);
        _speech.stop();
        setState(() => _isListening = false);
      });
    }
  }

  Future<void> _getAIResponse(String prompt) async {
    setState(() => _response = "Thinking...");
    // Replace this with real AI call later
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _response = "You said: $prompt");
    await _tts.speak(_response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Zaarvis AI'), backgroundColor: Colors.deepPurple),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_userSpeech.isEmpty ? 'Tap and Speak' : 'You: $_userSpeech',
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 20),
              Text(_response, style: const TextStyle(color: Colors.greenAccent, fontSize: 18)),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _listen,
                icon: const Icon(Icons.mic),
                label: Text(_isListening ? 'Listening...' : 'Tap to Speak'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
