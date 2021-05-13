# Flutter Starter

Flutter skeleton project that should be a starting point for every new project. It should have all environments already setup (dev, staging, production) for iOS and Android. Project will be CI/CD friendly. Q packages should be automatically added. Mandatory checks will be added to enforce inclusion of crashlytics, analytics, coding standards and test code coverage. Project won't build if any of this prerequisite are not met.

## Getting Started

Let's start by setting up our environment in order to run the init project script

### Prerequisites

Before running the initialization script, you must install the following software (Mac users already have these):
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Gem](https://rubygems.org/pages/download)
* [Xcodeproj](https://github.com/CocoaPods/Xcodeproj) (through RubyGems)

### Setup Firebase

* Create a new firebase project in the [Firebase console](https://firebase.google.com/)
* Add a new Android app and provide the package name which will be used for this app
* Download the google-services.json file
* Add a new iOS app and provide the bundle id which will be used for this app
* Download the GoogleService-Info.plist file

## Initialize the project

In order to initialize the project you must run the scripts/init_project bash script while inside the q_flutter_started folder.

### Required parameters

Here is the list of required paremeters:

* starterLocation - location of the q_flutter_starter on your device
* appName - project name
* package - package name for your app
* infoPlistProd - path to the GoogleService-Info.plist prod file
* googleServicesProd - path to the google-services.json prod file
* infoPlistDev - path to the GoogleService-Info.plist dev file
* googleServicesDev - path to the google-services.json dev file
* infoPlistStaging- path to the GoogleService-Info.plist staging file
* googleServicesStaging - path to the google-services.json staging file

### Example

Usage example:

```
bash scripts/init_project.sh --starterLocation ~/Downloads/q_flutter_starter --appName "My Little App" --package "com.example.mylittleapp" --infoPlistProd ~/Downloads/mylittleapp/prod/GoogleService-Info.plist --googleServicesProd ~/Downloads/mylittleapp/prod/google-services.json --infoPlistStaging ~/Downloads/mylittleapp/staging/GoogleService-Info.plist --googleServicesStaging ~/Downloads/mylittleapp/staging/google-services.json --infoPlistDev ~/Downloads/mylittleapp/dev/GoogleService-Info.plist --googleServicesDev ~/Downloads/mylittleapp/dev/google-services.json
```

## Features

Easily add new environmental variables to the project, check your (weighted) test coverage etc.

### Adding environmental variables

Just modify the main/app_environment.dart file to suit your needs. Add your custom properties to the _EnvProperties extension, and create the corresponding static getter in EnvInfo.

Example:

```
abstract class EnvInfo {
  ...
  static String get myCustomProperty => _environment._myCustomProperty;
}

extension _EnvProperties on AppEnvironment {
  ..
  static const _myCustomProperties = {
    AppEnvironment.DEV: 'PROPERTY_DEV',
    AppEnvironment.PROD: 'PROPERT_PROD',
    AppEnvironment.STAGING: 'PROPERTY_STAGING',
  };
  
  ...
  String get _myCustomProperty => _myCustomProperties[this]!;
}

```

Now you can easily access the created property anywhere in your code by calling:

```
final myProperty = EnvInfo.myCustomProperty
```