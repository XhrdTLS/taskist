import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TareasPage(),
    );
  }
}

class TareasPage extends StatefulWidget {
  const TareasPage({super.key});

  @override
  _TareasPageState createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tasks = ['kskjajs'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organiza tu día a día'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tareas'),
            Tab(text: 'Recordatorios'),
            Tab(text: 'Notas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tareas Tab
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Añadir tarea...',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            _addTask(value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                      ),
                      title: Text(
                        tasks[index],
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTask(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Recordatorios Tab (empty for now)
          const Center(child: Text('Recordatorios')),
          // Notas Tab (empty for now)
          const Center(child: Text('Notas')),
        ],
      ),
    );
  }
}
