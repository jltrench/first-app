import 'package:firstapp/components/task.dart';
import 'package:firstapp/data/task_inherited.dart';
import 'package:firstapp/screens/form_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InitialScreen extends StatefulWidget {
  InitialScreen({super.key});

  double levelGlobal = 0;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double level = 0;

  void _calculaLevelGlobal() {
    double level = 0;
    for (Task t in TaskInherited.of(context)!.taskList) {
      level += (t.nivel / 10) * t.dificuldade;
    }
    widget.levelGlobal = level;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Tarefas'),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _calculaLevelGlobal();
                      });
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 230,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.levelGlobal / 100,
                      ),
                    ),
                    Text('Level Global: ${widget.levelGlobal.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          )),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 70, top: 8),
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContent: context),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
