echo "Renaming project..."
projectName=`echo "$1" | tr '[:upper:]' '[:lower:]' | sed "s/ /_/g"`

currentDir=`pwd`
dirName=${currentDir: -17}
if [[ "$dirName" != "q_flutter_starter" ]]; then
  echo "Please position yourself in q_flutter_starter directory" && exit 1
fi

cat pubspec.yaml | sed "s%q_flutter_starter%${projectName}%" > tmp.yaml
rm pubspec.yaml && mv tmp.yaml pubspec.yaml

cd ..
mv q_flutter_starter "$projectName"
cd "$projectName"