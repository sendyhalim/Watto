platform = --platform ios
xcode_flags = -project "Watto.xcodeproj" -scheme "Watto" -configuration "Release" DSTROOT=/tmp/Watto.dst
xcode_flags_test = -project "Watto.xcodeproj" -scheme "Watto" -configuration "Debug"
components_plist = "Supporting Files/Components.plist"
temporary_dir = /tmp/Watto.dst

bootstrap:
	carthage bootstrap $(platform)

update:
	carthage update $(platform)

synx:
	synx Watto.xcodeproj

clean:
	rm -rf $(temporary_dir)
	xcodebuild $(xcode_flags) clean

test: clean bootstrap
	xcodebuild $(xcode_flags_test) test

lint:
	swiftlint

.PHONY: bootstrap update synx clean test lint

