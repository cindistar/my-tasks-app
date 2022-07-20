import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_tasks_app/bloc/task_bloc.dart';
import 'package:my_tasks_app/screens/my_tasks_screen.dart';
import 'package:my_tasks_app/widgets/add_task_widget.dart';
import 'package:my_tasks_app/widgets/task_card_widget.dart';

//class MockTaskBloc extends Mock implements TaskBloc {}

Widget homeScreenTest() {
  return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyTasksScreen()));
}

void main() {
  group('home screen test', () {
    testWidgets('text My Tasks is displayed more than once...', (tester) async {
      await tester.pumpWidget(homeScreenTest());
      expect(find.text('My Tasks'), findsWidgets);
    });

    testWidgets("should have only one FloatingActionButton", (tester) async {
      await tester.pumpWidget(homeScreenTest());
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets("should have only one add icon", (tester) async {
      await tester.pumpWidget(homeScreenTest());
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets("should have only one FloatingActionButton with add icon", (tester) async {
      await tester.pumpWidget(homeScreenTest());
      expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    });
  });

  testWidgets("should have only one ListView", (tester) async {
    await tester.pumpWidget(homeScreenTest());
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets("shouldn't find a CircularProgressIndicator", (tester) async {
    await tester.pumpWidget(homeScreenTest());
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets("find widget by key", (tester) async {
    await tester.pumpWidget(homeScreenTest());
    expect(find.byKey(const Key('column-key')), findsOneWidget);
  });

  // testWidgets("tasks are displayed", (tester) async {
  //   await tester.pumpWidget(homeScreenTest());
  //   await tester.pump();
  //   for (final task in tasksList) {
  //     expect(find.text(task.title), findsWidgets);
  //     expect(find.text(task.description), findsWidgets);
  //     expect(find.text(task.date), findsWidgets);
  //   }
  // });

  testWidgets("floatingActionButton when pressed should display AddTaskWidget to add a task", (tester) async {
    await tester.pumpWidget(homeScreenTest());
    final floatingButton = find.byType(FloatingActionButton);
    await tester.tap(floatingButton);
    await tester.pumpAndSettle();
    expect(find.byType(AddTaskWidget), findsOneWidget);
  });

  testWidgets("should not find TaskCardWidget", (tester) async {
    await tester.pumpWidget(homeScreenTest());
    expect(find.byType(TaskCardWidget), findsNothing);
  });
}
