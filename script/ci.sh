#!/usr/bin/env bash

set -e

xcodebuild -workspace SwiftyJSON.xcworkspace -scheme "HandyJSON iOS" -destination "platform=iOS Simulator,name=iPhone 6" test

xcodebuild -workspace SwiftyJSON.xcworkspace -scheme "HandyJSON macOS" test

xcodebuild -workspace SwiftyJSON.xcworkspace -scheme "HandyJSON tvOS" -destination "platform=tvOS Simulator,name=Apple TV 1080p" test
