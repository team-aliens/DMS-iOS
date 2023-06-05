import Foundation

public extension Array where Element == String {
    static func generateSkeletonDummy() -> [String] {
        [
            String(repeating: "가", count: .random(in: 1...15)),
            String(repeating: "가", count: .random(in: 1...15)),
            String(repeating: "가", count: .random(in: 1...15)),
            String(repeating: "가", count: .random(in: 1...15)),
            String(repeating: "가", count: .random(in: 1...15)),
            String(repeating: "가", count: .random(in: 1...15)),
            String(repeating: "가", count: .random(in: 1...15))
        ]
    }
}
