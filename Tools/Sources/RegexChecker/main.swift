import Foundation
import SwiftSyntax
import SwiftSyntaxParser

class RegexCheckerVisitor: SyntaxVisitor {
    var declaration: VariableDeclSyntax?

    var regexes = [String]()
    var shouldFail: Bool = false

    override func visit(_ node: VariableDeclSyntax) -> SyntaxVisitorContinueKind {
        for piece in (node.leadingTrivia ?? []) {
            if case let .lineComment(comment) = piece,
               comment.hasPrefix("// CHECK-REGEX") {
                self.declaration = node
                break
            }
        }

        return .visitChildren
    }

    override func visitPost(_ node: VariableDeclSyntax) {
        self.declaration = nil
    }

    override func visit(_ literal: StringLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        guard declaration != nil else {
            return .visitChildren
        }


        for line in declaration!.description.split(separator: "\n") {
            print("> \(line.trimmingCharacters(in: .whitespaces))")
        }

        guard literal.firstToken?.tokenKind == .rawStringDelimiter("#"),
              literal.lastToken?.tokenKind == .rawStringDelimiter("#") else {
            print("❌ Regex declaration must use raw string literal (i.e. #\"regex\"#).")
            shouldFail = true
            return .skipChildren
        }

        var regex = literal.description
        regex.removeFirst()
        regex.removeLast()

        do {
            let _ = try NSRegularExpression(pattern: regex)
            print("✅ Valid regular expression.")
        } catch {
            print("❌ Not a regular expression.")
            shouldFail = true
        }

        return .skipChildren
    }

    private func reportFailure(_ message: String) {
        print("^ \(message)")

        shouldFail = true
    }
}

func checkRegexLiterals(directory: URL) throws -> Bool {
    guard let enumerator = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: nil) else {
        fatalError("Can't enumerate directory at \(directory)")
    }

    var hasInvalidRegex = false

    for case let file as URL in enumerator {
        guard file.lastPathComponent.hasSuffix(".swift") else { continue }

        let visitor = RegexCheckerVisitor()
        let syntax = try SyntaxParser.parse(file)
        visitor.walk(syntax)

        if visitor.shouldFail {
            hasInvalidRegex = true
        }
    }

    return !hasInvalidRegex
}

func main() throws {
    let thisFile = URL(fileURLWithPath: #filePath)
    let sourcesDirectory = URL(string: "../../../WordPressShared", relativeTo: thisFile)!
    let success = try checkRegexLiterals(directory: sourcesDirectory)
    exit(success ? 0 : 1)
}

try main()
