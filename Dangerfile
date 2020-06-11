require 'git_diff_parser'

swiftlint.config_file = '.swiftlint.yml'
swiftlint.binary_path = "#{Dir.pwd}/Pods/SwiftLint/.build/x86_64-apple-macosx/release/swiftlint"
swiftlint.directory = '.'
swiftlint.verbose = true
# The plugin looks into the .swiftlint.yml config, but ours uses a remote one
swiftlint.lint_all_files = true

# See
# https://github.com/ashfurrow/danger-ruby-swiftlint/tree/a8d6b3a6e82994f500411ad7acc2039d2d7409c7#usage
diff = GitDiffParser::Patches.parse(github.pr_diff)
dir = "#{Dir.pwd}/"
swiftlint.lint_files(inline_mode: true) { |violation|
  diff_filename = violation['file'].gsub(dir, '')
  file_patch = diff.find_patch_by_file(diff_filename)
  file_patch != nil && file_patch.changed_lines.any? { |line| line.number == violation['line']}
}
