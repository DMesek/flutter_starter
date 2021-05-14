servicesClasspath="classpath 'com.google.gms:google-services:4.3.3'"
servicesPlugin="apply plugin: 'com.google.gms.google-services'"
crashlyticsClasspath="classpath 'com.google.firebase:firebase-crashlytics-gradle:2.2.0'"
crashlyticsPlugin="apply plugin: 'com.google.firebase.crashlytics'"
crashlyticsSdk="implementation 'com.google.firebase:firebase-crashlytics:17.0.0-beta01'"

cat ios/Podfile | sed "s%# platform :ios, '9.0'%platform :ios, '10.0'%" > tmp
rm ios/Podfile && mv tmp ios/Podfile

mkdir tmp
sed '/dependencies {$/a\
        ${GOOGLE_SERVICES}\
' android/build.gradle > tmp/build.gradle1
sed '/dependencies {$/a\
        ${CRASHLYTICS}\
' tmp/build.gradle1 > tmp/build.gradle

sed '/com.android.application.*$/a\
${GOOGLE_SERVICES}\
' android/app/build.gradle > tmp/build_app.gradle1
sed '/${GOOGLE_SERVICES}/a\
${CRASHLYTICS}\
' tmp/build_app.gradle1 > tmp/build_app.gradle2
sed '/dependencies {$/a\
${CRASHLYTICS_SDK}\
' tmp/build_app.gradle2 > tmp/build_app.gradle

rm android/build.gradle
rm android/app/build.gradle

cat tmp/build.gradle | sed "s%\${GOOGLE_SERVICES}%${servicesClasspath}%" > tmp/build.gradle2
cat tmp/build.gradle2 | sed "s%\${CRASHLYTICS}%${crashlyticsClasspath}%" > android/build.gradle

cat tmp/build_app.gradle | sed "s%\${GOOGLE_SERVICES}%${servicesPlugin}%" > tmp/build_app.gradle3
cat tmp/build_app.gradle3 | sed "s%\${CRASHLYTICS}%${crashlyticsPlugin}%" > tmp/build_app.gradle4
cat tmp/build_app.gradle4 | sed "s%\${CRASHLYTICS_SDK}%${crashlyticsSdk}%" > android/app/build.gradle

rm -r tmp

