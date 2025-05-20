import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final VoidCallback onEdit;
  final VoidCallback onChanged;
  final bool isSelected;

  const ProjectItem({
    super.key,
    required this.project,
    required this.onEdit,
    required this.onChanged,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Checkbox(
          value: isSelected,
          onChanged: (_) => onChanged(),
        ),
        title: Text(project.title),
        subtitle: Text(project.description),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onEdit,
        ),
      ),
    );
  }
}
