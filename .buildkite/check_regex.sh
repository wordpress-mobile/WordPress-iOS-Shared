#!/bin/bash -eu

cd Tools

echo '--- :swift: Build'
swift build --product RegexChecker

echo '--- :face_with_monocle: Check Regular Expressions'
swift run --skip-build RegexChecker
