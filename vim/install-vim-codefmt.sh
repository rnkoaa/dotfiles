#!/bin/sh
GOOGLE_JAVA_FORMAT_VERSION="1.9"

CODE_FMT_DIR="/opt/vim-codefmt"

GITHUB_BASE_DIR="https://github.com"

if [ ! -d "$CODE_FMT_DIR" ]; then
  mkdir $CODE_FMT_DIR

  # given the current user access to the directory
  chown -R $USER $CODE_FMT_DIR
fi

ARTIFACT_NAME="google-java-format-$GOOGLE_JAVA_FORMAT_VERSION-all-deps.jar"
DOWNLOAD_URL="$GITHUB_BASE_DIR/google/google-java-format/releases/download/google-java-format-$GOOGLE_JAVA_FORMAT_VERSION/$ARTIFACT_NAME"
DOWNLOAD_LOCATION="$CODE_FMT_DIR/$ARTIFACT_NAME"

# download codefmt jar into 
# wget https://github.com/google/google-java-format/releases/download/google-java-format-1.9/google-java-format-1.9-all-deps.jar

echo $DOWNLOAD_URL

wget $DOWNLOAD_URL -o $DOWNLOAD_LOCATION 

echo "done"
