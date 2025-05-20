import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project_item.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<Project> _projects = [
    Project(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Proyek A',
      description: 'Deskripsi A',
    ),
    Project(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Proyek B',
      description: 'Deskripsi B',
    ),
  ];

  final Set<int> _selectedIndexes = {};

  void editProject(int index) {
    final project = _projects[index];
    final titleController = TextEditingController(text: project.title);
    final descriptionController = TextEditingController(text: project.description);
    final imageUrlController = TextEditingController(text: project.imageUrl);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Project'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _projects[index] = Project(
                  imageUrl: imageUrlController.text,
                  title: titleController.text,
                  description: descriptionController.text,
                );
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void toggleSelection(int index) {
    setState(() {
      if (_selectedIndexes.contains(index)) {
        _selectedIndexes.remove(index);
      } else {
        _selectedIndexes.add(index);
      }
    });
  }

  void addProject() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final imageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Project'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty &&
                  imageUrlController.text.isNotEmpty) {
                setState(() {
                  _projects.add(Project(
                    imageUrl: imageUrlController.text,
                    title: titleController.text,
                    description: descriptionController.text,
                  ));
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addProject,
            tooltip: 'Tambah Proyek',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return ProjectItem(
            project: _projects[index],
            isSelected: _selectedIndexes.contains(index),
            onChanged: () => toggleSelection(index),
            onEdit: () => editProject(index),
          );
        },
      ),
    );
  }
}
