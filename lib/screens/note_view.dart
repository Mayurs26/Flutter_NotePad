import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    super.key,
    required this.note,
    required this.index,
    required this.onNoteDeleted,
  });

  final NoteModel note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note View"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Delete This?"),
                    content: Text("Note ${note.title} will be deleted!"),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onNoteDeleted(index);
                          Navigator.of(context).pop();
                        },
                        child: const Text("DELETE"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: TextStyle(fontSize: 26)),
            SizedBox(height: 20),
            Text(note.story, style: const TextStyle(fontSize: 26)),
          ],
        ),
      ),
    );
  }
}
