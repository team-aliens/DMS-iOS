import Foundation

public struct FetchPointListResponseDTO: Decodable {
    public init(points: [SinglePointResponseDTO]) {
        self.points = points
    }

    public let points: [SinglePointResponseDTO]
}
