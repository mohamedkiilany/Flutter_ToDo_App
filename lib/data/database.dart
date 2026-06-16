import 'package:hive_flutter/adapters.dart';

class tododatabase {
  List tasks = [];
  //  await Hive.openBox('mybox');
  final _mybox = Hive.box("mybox");

  void initialData() {
    tasks = [
      ["make tutorial", false],
      ["do exercise", true],
    ];
    updateData();
  }

  void localData() {
    tasks = _mybox.get("TASKS");
  }

  void updateData() {
    _mybox.put("TASKS", tasks);
  }
}
