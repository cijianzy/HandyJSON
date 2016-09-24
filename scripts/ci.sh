#!/usr/bin/env bash

set -e

xcodebuild -workspace HandyJSON.xcworkspace -scheme "HandyJSON iOS" -destination "platform=iOS Simulator,name=iPhone 6" test

