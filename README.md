# Flutter Task with Appwrite Integration

A Flutter application that demonstrates backend integration with Appwrite.


## Setup Instructions

1. Clone the repository
2. Create a `.env` file in the root directory with the following:
```
APPWRITE_ENDPOINT=your_appwrite_endpoint
APPWRITE_PROJECT_ID=your_project_id
APPWRITE_DATABASE_ID=your_database_id
APPWRITE_COLLECTION_ID=your_collection_id
```
3. Run `flutter pub get`
4. Run the app using `flutter run`

## Appwrite Backend Configuration 

### Collection Structure
- Collection Name: `items`
- Fields:
  - `title` (String)
  - `description` (String)

### Sample Data
The backend contains three pre-configured items that will be fetched when clicking the "Load Data" button.

## Screenshots

### Main Screen
[Main screen with Load Data button](/screenshots/main_screen.png)

### Data Loaded State
[Screenshot of loaded items in ListView](/screenshots/loaded_state.png)


## Tech Stack

- Flutter
- Appwrite Backend

