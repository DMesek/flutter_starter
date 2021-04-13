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

## Run the script

In order to initialize the project you must run the scripts/init_project bash script while inside the q_flutter_started folder.

### Required parameters

Here is the list of required paremeters:

* n - project name
* p - package name 
* i - path to the GoogleService-Info.plist file
* a - path to the google-services.json file

### Example

Usage example:

```
cd q_flutter_starter
bash scripts/init_project.sh -n "My Little App" -p "com.example.mylittleapp" -i ~/Downloads/mylittleapp GoogleService-Info.plist -a ~/Downloads/mylittleapp/google-services.json
```