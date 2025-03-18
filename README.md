Flutter Simple Fitness Tracker

<h2>Overview</h2>

The Fitness Tracker App is a Flutter-based mobile application designed to help users track their daily workouts and monitor their progress toward a daily calorie goal. The app allows users to:

    <li>Add workouts with details like name and calories burned.</li>

    <li>Set a daily calorie goal.</li>

    <li>View a list of workouts and track progress toward the goal.</li>

Features

    Home Page:

        Displays daily progress toward the calorie goal using a progress bar.

        Shows a list of workouts with details (name, calories burned, and date).

        Provides buttons to add a workout and set a daily calorie goal.

    Add Workout Page:

        A form to add a new workout with name and calories burned.

        Validates user input.

    Set Goal Page:

        Allows the user to set a daily calorie goal.

    State Management:

        Uses setState to manage the list of workouts and the daily calorie goal.

    UI Enhancements:

        Custom themes, rounded corners, elevation, and icons for a modern and beautiful design.

File Structure

The app is divided into three main files:

    main.dart:

        The entry point of the app.

        Initializes the app and sets up the theme.

    home_page.dart:

        Contains the HomePage widget and its logic.

        Manages the list of workouts and the daily calorie goal.

        Displays the progress bar and workout list.

    workout_pages.dart:

        Contains the AddWorkoutPage and SetGoalPage widgets.

        Handles user input for adding workouts and setting goals.

Code Documentation
1. main.dart

    Purpose: The entry point of the app.

    Key Components:

        MyApp: The root widget of the app.

        MaterialApp: Sets up the app theme and defines the home page (HomePage).

2. home_page.dart

    Purpose: Displays the main screen of the app.

    Key Components:

        Workout: A model class to store workout details (name, calories burned, and date).

        HomePage: The main widget that displays the progress bar and workout list.

        _HomePageState: Manages the state of the HomePage widget.

            _workouts: A list of workouts.

            _dailyCalorieGoal: The daily calorie goal.

            _addWorkout: Adds a new workout to the list.

            _setDailyCalorieGoal: Updates the daily calorie goal.

            _getTotalCaloriesBurned: Calculates the total calories burned.

            _navigateToAddWorkout: Navigates to the AddWorkoutPage.

            _navigateToSetGoal: Navigates to the SetGoalPage.

3. workout_pages.dart

    Purpose: Contains pages for adding workouts and setting goals.

    Key Components:

        AddWorkoutPage: A form to add a new workout.

            _formKey: Validates the form.

            _nameController and _caloriesController: Capture user input.

        SetGoalPage: A form to set the daily calorie goal.

            _goalController: Captures user input for the goal.

How to Run the App

    Prerequisites:

        Install Flutter SDK.

        Set up an IDE (e.g., Android Studio, VS Code).

    Steps:

        Clone the project or create a new Flutter project.

        Replace the contents of main.dart, home_page.dart, and workout_pages.dart with the provided code.

        Run the app using flutter run.

Screenshots

    Home Page:

        Displays daily progress and a list of workouts.

        Buttons to add a workout and set a goal.

    Add Workout Page:

        A form to add a new workout.

    Set Goal Page:

        A form to set the daily calorie goal.

Future Enhancements

    Edit/Delete Workouts:

        Allow users to edit or delete existing workouts.

    Weekly Progress:

        Add a weekly progress view to track calories burned over time.

    More Metrics:

        Include additional fitness metrics like steps, distance, etc.

    Animations:

        Add animations for a more engaging user experience.

    Database Integration:

        Use a database (e.g., SQLite, Firebase) to persist data.

Dependencies

The app uses the following dependencies:

    Flutter SDK: For building the app.

    Material Design: For UI components.

Contributing

If you’d like to contribute to the project:

    Fork the repository.

    Create a new branch for your feature or bugfix.

    Submit a pull request.

License

This project is open-source and available under the MIT License.
