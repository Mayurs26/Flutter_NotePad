import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/screens/home_screen.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key, required this.onNewNoteCreated});

  final Function(NoteModel) onNewNoteCreated;

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  final titleController = TextEditingController();
  final storyController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    storyController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 56, 56),
        centerTitle: true,
        title: Text("Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 35, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                focusColor: const Color.fromARGB(255, 1, 85, 231),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: storyController,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Your Story",
                focusColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (storyController.text.isEmpty) {
            return;
          }
          final note = NoteModel(
            title: titleController.text,
            story: storyController.text,
          );

          widget.onNewNoteCreated(note);

          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
