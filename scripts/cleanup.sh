sed -n '/^flavorizr/q;p' pubspec.yaml | sed "s/flutter_flavorizr: 1.0.11/build_runner: ^1.12.2/" > tmp.yaml
mv tmp.yaml pubspec.yaml

mv android/app/src/dev/google_services.json android/app/src/dev/google-services.json 
mv android/app/src/prod/google_services.json android/app/src/prod/google-services.json 
mv android/app/src/staging/google_services.json android/app/src/staging/google-services.json 