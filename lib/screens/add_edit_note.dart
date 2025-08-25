import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission7/bloc/note_bloc.dart';
import 'package:submission7/bloc/note_event.dart';
import 'package:submission7/model/note.dart';
import 'package:submission7/widgets/custom_text.dart';

class AddEditNote extends StatefulWidget {
  const AddEditNote({super.key});

  @override
  State<AddEditNote> createState() => _AddEditNoteState();
}

class _AddEditNoteState extends State<AddEditNote> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            tooltip: 'Save note',
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<NoteBloc>(context).add(
                  AddNoteEvent(
                    Note(
                      title: _titleController.text,
                      content: _contentController.text,
                    ),
                  ),
                );
                Navigator.pushNamed(context, '/note_screen');
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hint: CustomBigText(text: 'Title'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter note title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _contentController,
                      decoration: InputDecoration(
                        hint: Text('Type your note here'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomSection(
        title: _titleController.text,
        content: _contentController.text,
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key, required this.title, this.content});

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide())),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Last edited on 19.30'),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 192,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 56,
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<NoteBloc>(context).add(
                                    AddNoteEvent(
                                      Note(
                                        title: title,
                                        content: content ?? '',
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.done, size: 24),
                                    SizedBox(width: 12),
                                    CustomRegularText(text: 'Save Note'),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 8),

                            SizedBox(
                              height: 56,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.trash,
                                    size: 24,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Delete Note',
                                    style: TextStyle(
                                      height: 1.4,
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 48,
                width: 48,
                color: Color(0xFF394675),
                child: Icon(Icons.more_horiz, size: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
