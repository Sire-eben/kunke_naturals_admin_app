# Usage
#  ./build.sh <environment> <platform>
#   environment: staging, production, default: production
#   platform: android, ios, by default both platforms are built

if [[ "$1" == *staging* ]]; then
    echo "Building for staging"
    if [[ "$2" == *android* ]]; then
        echo "Building android"
        flutter build apk --flavor staging --target lib/main_staging.dart --split-per-abi
    elif [[ "$2" == *ios* ]]; then
        echo "Building iOS"
        flutter build ipa --flavor staging --target lib/main_staging.dart
    else 
      flutter build apk --flavor staging --target lib/main_staging.dart --split-per-abi
      flutter build ipa --flavor staging --target lib/main_staging.dart
    fi
else
    echo "Building for production"
    if [[ "$2" == *android* ]]; then
        echo "Building android"
        flutter build appbundle --flavor production --target lib/main_production.dart
    elif [[ "$2" == *ios* ]]; then
        echo "Building iOS"
        flutter build ipa --flavor staging --target lib/main_production.dart
    else 
        flutter build appbundle --flavor production --target lib/main_production.dart
        flutter build ipa --flavor staging --target lib/main_production.dart
    fi
fi
