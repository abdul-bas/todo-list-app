import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list_app/model/task_model.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createTask(TaskModel model) async {
    try {
      final doc = _firestore.collection('tasks').doc();

      final updatedTask = model.copyWith(id: doc.id);

      await doc.set(updatedTask.toMap());

      return "Task created successfully";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> updateTask(TaskModel model) async {
    try {
      await _firestore.collection('tasks').doc(model.id).update(model.toMap());

      return "Task updated successfully";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> deleteTask(String id) async {
    try {
      await _firestore.collection('tasks').doc(id).delete();

      return "Task deleted successfully";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> updateTaskStatus({
    required String id,
    required bool isCompleted,
  }) async {
    try {
      await _firestore.collection('tasks').doc(id).update({
        'isCompleted': isCompleted,
      });

      return "Task status updated";
    } catch (e) {
      return e.toString();
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    return _firestore.collection('tasks').get();
  }

  Stream<List<TaskModel>> getTask() {
    return _firestore.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromMap(doc.data());
      }).toList();
    });
  }
}
