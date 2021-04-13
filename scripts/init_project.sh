while getopts ":n:p:i:a:" opt; do
  case $opt in
    n) appName="$OPTARG"
    ;;
    p) packageName="$OPTARG"
    ;;
    i) infoPlistLocation="$OPTARG"
    ;;
    a) googleServicesLocation="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" && exit 1
    ;;
  esac
done

# Check if arguments are provided
if [ -z "$appName" ]; then
  echo "Please provide the app name using the -n option" && exit 1
fi
if [ -z "$packageName" ]; then
  echo "Please provide the project package name/bundle id using the -p option" && exit 1
fi
if [ ! -f "$infoPlistLocation" ]; then
  echo "Please provide the location of the GoogleService-Info.plist file" && exit 1
fi
if [ ! -f "$googleServicesLocation" ]; then
  echo "Please provide the location of the google-services.json file" && exit 1
fi

matches=`echo "$infoPlistLocation" | grep -e "GoogleService-Info.plist$"`
if [[ -z "$matches" ]]; then
  echo "Please check the name of your GoogleService-Info.plist file" && exit 1
fi
matches=`echo "$googleServicesLocation" | grep -e "google-services.json$"`
if [[ -z "$matches" ]]; then
  echo "Please check the name of your google-services.json file" && exit 1
fi

cp "$infoPlistLocation" .firebase/ios
cp "$googleServicesLocation" .firebase/android

bash scripts/rename_project.sh "$appName" && bash scripts/setup_flavors.sh "$appName" "$packageName"
if [[ "$?" == "0" ]]; then
  echo "All done :)"
fi
