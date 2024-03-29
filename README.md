# SwiftLintPlugin
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

An Xcode plugin to enable/disable running [SwiftLint](https://github.com/realm/SwiftLint), and customizable by shell script.

Many thanks to [ExtraBuildPhase](https://github.com/norio-nomura/ExtraBuildPhase) for the base code. This plugin just adds ability to enable/disable running the lint. If you don't want to run swiftLint with every build. Then, use this plugin.

![screenshots](screenshot.png)

## Requirements
- Xcode 7.1 or later
- [SwiftLint](https://github.com/realm/SwiftLint) for default shell script

## Installation

### Using Installers
- [Alcatraz](http://alcatraz.io) (Comming soon)

### Build By Yourself
1. Building the project with Xcode will install the plugin.

Restart Xcode after installing

## Usage

1. Enable SwiftLint from Product -> SwiftLint.
2. Build the project.
3. You can then Disable SwiftLint from Product -> SwiftLint, then build again.

## Configuration
```sh
# Change shell script
defaults write com.mohamede1945.SwiftLintPlugin shellScript -string '
if which swiftlint >/dev/null; then
    swiftlint lint --use-script-input-files --config ~/.swiftlint.yml 2>/dev/null
fi
exit 0 # ignore result of swiftlint
'
# Changes will be applied after "Product > Clean⇧⌘K"

# Show environment variables in build log
defaults write com.mohamede1945.SwiftLintPlugin showEnvVarsInLog -bool true

# Run shell script not only on Xcode, but also xcodebuild.
defaults write com.mohamede1945.SwiftLintPlugin isNotLimitedToXcode -bool true
```

## Author

Mohamed Afifi, mohamede1945@gmail.com

## License

SwiftLintPlugin is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
