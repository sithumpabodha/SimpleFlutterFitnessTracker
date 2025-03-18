import 'package:flutter/material.dart';
import 'workout_pages.dart';

class Workout {
  String name;
  int caloriesBurned;
  DateTime date;

  Workout(
      {required this.name, required this.caloriesBurned, required this.date});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Workout> _workouts = [];
  int _dailyCalorieGoal = 2000;

  void _addWorkout(String name, int caloriesBurned) {
    setState(() {
      _workouts.add(Workout(
        name: name,
        caloriesBurned: caloriesBurned,
        date: DateTime.now(),
      ));
    });
  }

  void _setDailyCalorieGoal(int goal) {
    setState(() {
      _dailyCalorieGoal = goal;
    });
  }

  int _getTotalCaloriesBurned() {
    return _workouts.fold(0, (sum, workout) => sum + workout.caloriesBurned);
  }

  void _navigateToAddWorkout() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWorkoutPage()),
    );

    if (result != null) {
      _addWorkout(result['name'], result['calories']);
    }
  }

  void _navigateToSetGoal() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SetGoalPage()),
    );

    if (result != null) {
      _setDailyCalorieGoal(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalCaloriesBurned = _getTotalCaloriesBurned();
    final progress = totalCaloriesBurned / _dailyCalorieGoal;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Daily Progress',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Calories Burned: $totalCaloriesBurned / $_dailyCalorieGoal',
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _workouts.length,
              itemBuilder: (context, index) {
                final workout = _workouts[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.fitness_center, color: Colors.blue),
                    title: Text(
                      workout.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${workout.caloriesBurned} calories on ${workout.date.toString().split(' ')[0]}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _navigateToAddWorkout,
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.greenAccent,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _navigateToSetGoal,
            child: Icon(Icons.flag, color: Colors.white),
            backgroundColor: Colors.yellowAccent,
          ),
        ],
      ),
    );
  }
}
