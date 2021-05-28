# Get the named parameters
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"*  ]]; then
        param="${1/--/}"
        declare $param="$2"
   fi
  shift
done

# Check if arguments are provided
if [ -z "$starterLocation" ]; then
  echo "Please enter the q_flutter_starter location" && exit 1
fi
if [ -z "$appName" ]; then
  echo "Please provide the app name using the -n option" && exit 1
fi
if [ -z "$package" ]; then
  echo "Please provide the project prod package name/bundle id using the --package option" && exit 1
fi
if [ -z "$packageDev" ]; then
  echo "Please provide the project dev package name/bundle id using the --packageDev option" && exit 1
fi
if [ -z "$packageStaging" ]; then
  echo "Please provide the project staging package name/bundle id using the --packageStaging option" && exit 1
fi

cd $starterLocation

mkdir .firebase
mkdir .firebase/{android,ios}
mkdir .firebase/android/{prod,dev,staging}
mkdir .firebase/ios/{prod,dev,staging}
cp "$infoPlistProd" .firebase/ios/prod
cp "$googleServicesProd" .firebase/android/prod
cp "$infoPlistDev" .firebase/ios/dev
cp "$googleServicesDev" .firebase/android/dev
cp "$infoPlistStaging" .firebase/ios/staging
cp "$googleServicesStaging" .firebase/android/staging

bash scripts/rename_project.sh "$appName" && bash scripts/setup_flavors.sh "$appName" "$package" "$packageDev" "$packageStaging"
if [[ "$?" == "0" ]]; then
  bash scripts/cleanup.sh
  flutter pub upgrade --major-versions
  cd ios && pod repo update && cd ..
  bash scripts/configure_firebase.sh
  rm -r scripts
  bash setup_git.sh "$remoteSSH"
  echo "Don't forget to setup the signing for ios"
  echo "All done :)"
fi


