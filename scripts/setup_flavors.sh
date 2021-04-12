appName="$1"
packageId="$2"

stagingId="${packageId}.staging"
devId="${packageId}.dev"

cat pubspec.yaml | sed "s/\${APP_NAME}/$appName/g" | sed "s/\${ID_DEV}/$devId/g" | sed "s/\${ID_STAGING}/$stagingId/g" | sed "s/\${ID_PROD}/$packageId/g" > scripts/tmp.yaml
rm pubspec.yaml 
mv scripts/tmp.yaml pubspec.yaml

echo "Setting up flavors..."
flutter pub get
flutter pub run flutter_flavorizr
rm lib/app.dart lib/flavors.dart lib/main-dev.dart lib/main-staging.dart lib/main-prod.dart
rm -r lib/pages

cat lib/main/app_environment.dart | sed "s/APP_NAME/$appName/g" > tmp.dart
rm lib/main/app_environment.dart && mv tmp.dart lib/main/app_environment.dart

# Modify the ios flavors
flutterBase='FLUTTER_TARGET=lib/main/'
cat ios/Flutter/devDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_dev.dart%" > tmp.xcconfig
rm ios/Flutter/devDebug.xcconfig && mv tmp.xcconfig ios/Flutter/devDebug.xcconfig

cat ios/Flutter/devRelease.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_dev.dart%" > tmp.xcconfig
rm ios/Flutter/devRelease.xcconfig && mv tmp.xcconfig ios/Flutter/devRelease.xcconfig

cat ios/Flutter/stagingDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_staging.dart%" > tmp.xcconfig
rm ios/Flutter/stagingDebug.xcconfig && mv tmp.xcconfig ios/Flutter/stagingDebug.xcconfig

cat ios/Flutter/stagingDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_staging.dart%" > tmp.xcconfig
rm ios/Flutter/stagingDebug.xcconfig && mv tmp.xcconfig ios/Flutter/stagingDebug.xcconfig

cat ios/Flutter/prodDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_prod.dart%" > tmp.xcconfig
rm ios/Flutter/prodDebug.xcconfig && mv tmp.xcconfig ios/Flutter/prodDebug.xcconfig

cat ios/Flutter/prodDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_prod.dart%" > tmp.xcconfig
rm ios/Flutter/prodDebug.xcconfig && mv tmp.xcconfig ios/Flutter/prodDebug.xcconfig
