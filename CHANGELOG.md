# Changelog

The format of this document is inspired by [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and the project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- This is a comment, you won't see it when GitHub renders the Markdown file.

When releasing a new version:

1. Remove any empty section (those with `_None._`)
2. Update the `## Unreleased` header to `## <version_number>`
3. Add a new "Unreleased" section for the next iteration, by copy/pasting the following template:

## Unreleased

### Breaking Changes

_None._

### New Features

_None._

### Bug Fixes

_None._

### Internal Changes

_None._

-->

## Unreleased

### Breaking Changes

_None._

### New Features

_None._

### Bug Fixes

_None._

### Internal Changes

_None._

## 2.3.1

### Bug Fixes

- Remove video block content from post excerpt [#352]

## 2.3.0

### New Features

- Add editor upload paused event [#343]

## 2.2.0

### New Features

- Strip Gutenberg VideoPress block for excerpt [#339]

## 2.1.0

### New Features

- Add `ConsoleLogger`, a `WordPressLoggingDelegate` implementation that can be used during development and debugging [#335]

## 2.0.1

### Internal Changes

- Fix an occasional crash caused by `performSelector:withObject:` [#328]
- Replace the symbolic links in the include directory with real header files [#329]

## 2.0.0

### Breaking Changes

- Remove CocoaLumberjack. The app needs to provide a `WordPressLoggingDelegate` implementation [#325]

### New Features

- Add Swift Package Manager support [#321]

### Bug Fixes

- Fix an issue where 'pod install' produces a 'duplicate UUID' warning. [#327]

### Internal Changes

- Add this changelog entry about changelog itself [#317]
- Remove FormatterKit [#320]
- Move away from Specta, use Quick instead [#319]
- Fix an occasional crash caused by `performSelector:withObject:` [#328]
