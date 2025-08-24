import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:submission7/bloc/note_bloc.dart';
import 'package:submission7/model/note.dart';
import 'package:submission7/repositories/note_repository.dart';
import 'package:submission7/screens/add_note.dart';
import 'package:submission7/screens/login_screen.dart';
import 'package:submission7/screens/note_screen.dart';
import 'package:submission7/screens/register_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Note>(NoteAdapter());

  await Hive.openBox<Note>('Note');

  runApp(MyApp(noteRepository: NoteRepository()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.noteRepository}) : super(key: key);

  final NoteRepository noteRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => noteRepository)],
      child: BlocProvider(
        create: (_) => NoteBloc(noteRepository),
        child: MaterialApp(
          title: 'HSI Notes',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/note_screen',
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/add_note': (context) => AddNote(),
            '/note_screen': (context) => NoteScreen(),
          },
        ),
      ),
    );
  }
}
