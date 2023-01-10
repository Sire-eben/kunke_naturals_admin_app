flutter clean
rm -rf pubspec.lock ios/Pods ios/Podfile.lock
# rm -rf pubspec.lock ios/Pods ios/Podfile.lock ~/.pub-cache
flutter pub get
cd ios
pod install