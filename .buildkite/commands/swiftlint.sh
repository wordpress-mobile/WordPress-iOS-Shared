#!/bin/bash -u

echo "--- :swift: Running SwiftLint"

set +e
SWIFTLINT_OUTPUT=$(swiftlint lint --quiet --reporter markdown "$@")
SWIFTLINT_EXIT_STATUS=$?
set -e

WARNINGS=$(echo -e "$SWIFTLINT_OUTPUT" | awk '/:warning:/')
ERRORS=$(echo -e "$SWIFTLINT_OUTPUT" | awk '/:error:/')

# The SwiftLint Markdown output has the table formatting in the first two lines, so we print them, too.

if [ -n "$WARNINGS" ]; then
  echo "$WARNINGS"
  printf "**SwiftLint Warnings**\n%b\n%b\n" "$(echo -e "$SWIFTLINT_OUTPUT" | head -n 2)" "$WARNINGS" \
    | buildkite-agent annotate --style 'warning'
fi

if [ -n "$ERRORS" ]; then
  echo "$ERRORS"
  printf "**SwiftLint Errors**\n%b\n%b\n" "$(echo -e "$SWIFTLINT_OUTPUT" | head -n 2)" "$ERRORS" \
    | buildkite-agent annotate --style 'error'
fi

exit $SWIFTLINT_EXIT_STATUS
