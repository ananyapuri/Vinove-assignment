# Flutter Location Screen

A simple Flutter app that retrieves and displays the user’s current location using the **Geolocator** package. The app prompts the user for location permissions and updates the location dynamically on the screen as the user moves.

## Features

- **Retrieves the user’s current location**: Uses the Geolocator package to fetch the latitude and longitude.
- **Real-time updates**: Automatically updates the location on the screen as the user changes location.
- **Handles location permissions**: Asks the user for permission to access the location and shows an error message if access is denied.

## Screenshots

(You can include screenshots of your app here.)

## Getting Started

### Prerequisites

Ensure you have the following installed on your machine:

- Flutter SDK
- A code editor (e.g., VS Code or Android Studio)
- Android/iOS Emulator or a physical device

### Installation

1. **Clone the repo**:
   ```bash
   git clone https://github.com/mandeep888/Vinove-assignment.git
   cd Vinove-assignment
   ```

2. **Install dependencies**:
   Open the `pubspec.yaml` file and ensure the following dependencies are included:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     geolocator: ^9.0.2
   ```

   Then, run the following command in your terminal:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   To launch the app, run:
   ```bash
   flutter run
   ```

### Usage

Once the app is running:

1. Upon launch, the app will ask for location permissions. Allow the app to access your location.
2. The screen will display your current latitude and longitude.
3. As you move, the location information will update automatically.

### Handling Permissions

If location access is denied, the app will display an error message. Make sure to include location permission in both Android and iOS configurations:

#### Android
Open `android/app/src/main/AndroidManifest.xml` and add the following permissions:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

#### iOS
In `ios/Runner/Info.plist`, add the following keys:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show your current position.</string>
```

## Built With

- **Flutter**: Framework for building natively compiled applications.
- **Geolocator**: Flutter plugin for accessing location information.

## Contributing

Feel free to contribute by submitting a pull request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
