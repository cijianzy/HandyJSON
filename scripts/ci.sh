#!/usr/bin/env bash

set -e

xcodebuild -scheme "HandyJSON iOS" -destination "platform=iOS Simulator,name=iPhone 6" test

xcodebuild -scheme "HandyJSON OSX" test

xcodebuild -scheme "HandyJSON tvOS" -destination "platform=tvOS Simulator,name=Apple TV 1080p" test
