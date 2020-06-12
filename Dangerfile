require 'git_diff_parser'

swiftlint.config_file = '.swiftlint.yml'

# While the remote config feature in SwiftLint hasn't been shipped, we need to
# fetch its branch and build SwiftLint manually.
swiftlint.binary_path = "#{Dir.pwd}/Pods/SwiftLint/.build/x86_64-apple-macosx/release/swiftlint"

# The plugin looks into the .swiftlint.yml config to know in which folders to
# look for files to lint. Our config only has the URL of the remote config,
# though, so no file to lint would be found. This option makes the plugin lint
# all the files, and is "the same as [if] you were running `swiftlint` on the
# root folder".
# See
# https://github.com/ashfurrow/danger-ruby-swiftlint/tree/a8d6b3a6e82994f500411ad7acc2039d2d7409c7#usage
swiftlint.lint_all_files = true

# Despite using we want inline comments only in the files that changed in the
# PR, instead of a long wall of text with each of the files in the repo failing
# to lint. This extra code makes it possible.
# See
# https://github.com/ashfurrow/danger-ruby-swiftlint/tree/a8d6b3a6e82994f500411ad7acc2039d2d7409c7#usage
diff = GitDiffParser::Patches.parse(github.pr_diff)
dir = "#{Dir.pwd}/"
swiftlint.lint_files(inline_mode: true) { |violation|
  diff_filename = violation['file'].gsub(dir, '')
  file_patch = diff.find_patch_by_file(diff_filename)
  file_patch != nil && file_patch.changed_lines.any? { |line| line.number == violation['line']}
}
