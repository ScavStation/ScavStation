#!/bin/sh
set -e
if [ -f "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}/byond/bin/DreamMaker" ];
then
  echo "Using cached directory."
else
  echo "Setting up BYOND."
  mkdir -p "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}"
# Part 1 of unit test fix. Detect if this is a github runner and copies repo copy of the installer to install location if so. Fixes github unit tests since byond.com has decided to be asses.
  if [ -d "/home/runner" ]
  then
    cp "./BYOND-Installer/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}/byond.zip"
  fi
  cd "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}"
  echo "Installing DreamMaker to $PWD"
# Part 2 of unit text fix. Uses local copy of installer for github runners, Downloads from byond.com for everyone else.
  if [ ! -f "byond.zip" ]
  then
    curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip
  fi
  unzip -o byond.zip
  cd byond
  make here
fi
