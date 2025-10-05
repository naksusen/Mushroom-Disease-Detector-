# 🍄 Mushease - Mushroom Disease Detector

**Mushease** is an AI-powered Android application that uses TensorFlow Lite to detect and analyze diseases in oyster mushrooms. The app provides instant health assessment, disease identification, and treatment recommendations for mushroom cultivators and enthusiasts.

## ✨ Features

- **🔍 AI-Powered Disease Detection**: Uses machine learning to identify mushroom diseases
- **📸 Camera Integration**: Take photos or select from gallery for analysis
- **🏥 Disease Classification**: Detects 5 different conditions:
  - Healthy Oyster Mushroom
  - Brown Blotch Disease
  - Green Mold Contamination
  - Soft Rot Disease
  - Invalid/Non-mushroom objects
- **📊 Confidence Scoring**: Shows confidence levels for each classification
- **📚 Educational Content**: Detailed information about diseases and treatments
- **🌿 Mushroom Database**: Comprehensive list of mushroom types and descriptions


**⚠️ SECURITY NOTICE**: This repository does NOT include the `google-services.json` file for security reasons. You must create your own Google API key to use this application.


## 🚀 Getting Started

### Prerequisites

- Android Studio (latest version)
- Android device with API level 21+ (Android 5.0+)
- Camera permissions enabled

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/naksusen/mushroom-disease-detector.git.git
   cd mushroom-disease-detector
   ```

2. **Open in Android Studio**
   - Launch Android Studio
   - Open the project folder
   - Wait for Gradle sync to complete

3. **Build and Install**
   ```bash
   ./gradlew assembleDebug
   adb install -t -r app/build/intermediates/apk/debug/app-debug.apk
   ```

4. **Launch the App**
   ```bash
   adb shell am start -n com.example.herblife/.MainActivity
   ```

## 🏗️ Project Structure

```
app/
├── src/main/
│   ├── java/com/example/herblife/
│   │   ├── MainActivity.java          # Splash screen
│   │   ├── MainActivity2.java         # Main menu
│   │   ├── scanmushrooms.java         # Core scanning functionality
│   │   ├── MushroomDetails.java       # Disease details dialog
│   │   ├── MushroomList.java          # Mushroom database
│   │   └── MushroomView.java          # Individual mushroom view
│   ├── ml/
│   │   └── model_unquant.tflite       # TensorFlow Lite model
│   └── res/
│       ├── layout/                    # UI layouts
│       ├── drawable/                  # Images and icons
│       └── values/                    # Strings and resources
```

## 🤖 AI Model

The app uses a custom TensorFlow Lite model trained to classify oyster mushroom health:

- **Input**: 224x224 RGB images
- **Output**: 6-class classification
- **Model**: `model_unquant.tflite`
- **Framework**: TensorFlow Lite Support Library

### Disease Detection Classes

1. **Healthy Oyster Mushroom** - No disease detected
2. **Brown Blotch** - Bacterial disease (Pseudomonas tolaasii)
3. **Green Mold** - Fungal contamination (Trichoderma spp.)
4. **Soft Rot** - Bacterial soft rot (Pectobacterium carotovorum)
5. **Invalid Object** - Non-mushroom items
6. **Non-Oyster Mushroom** - Other mushroom species

## 📱 Usage

1. **Launch the App**: Open Mushease on your Android device
2. **Scan Mushroom**: Tap "Scan Oyster Mushroom" button
3. **Take Photo**: Use camera or select from gallery
4. **View Results**: Get instant disease analysis with confidence scores
5. **Learn More**: Access detailed information about detected diseases
6. **Browse Database**: Explore the mushroom species database

## 🛠️ Development

### Prerequisites
- Android Studio Arctic Fox or later
- Android SDK 21+
- Java 8+

### Build Configuration
```gradle
android {
    namespace 'com.example.herblife'
    compileSdk 33
    defaultConfig {
        applicationId "com.example.herblife"
        minSdk 21
        targetSdk 33
    }
}
```

### Dependencies
- TensorFlow Lite Support: `0.1.0`
- AndroidX AppCompat: `1.6.0`
- Material Design Components: `1.7.0`
- YouTube Player: `11.1.0`
- GIF Support: `1.2.19`

## 🔧 Technical Details

- **Architecture**: Native Android (Java)
- **ML Framework**: TensorFlow Lite
- **Image Processing**: Custom bitmap preprocessing
- **UI Framework**: Android Views with Material Design
- **Permissions**: Camera, External Storage


## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



**Made with ❤️ for mushroom enthusiasts and cultivators**
