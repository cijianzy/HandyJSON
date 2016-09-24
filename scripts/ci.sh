#!/usr/bin/env bash

set -e

xcodebuild -project HandyJSON.xcodeproj -scheme "HandyJSONTests" -destination "platform=iOS Simulator,name=iPhone 6" test

