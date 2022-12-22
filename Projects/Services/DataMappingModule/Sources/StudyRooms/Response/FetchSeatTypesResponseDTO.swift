import Foundation

public struct FetchSeatTypesResponseDTO: Decodable {
    public init(types: [SingleSeatTypeResponseDTO]) {
        self.types = types
    }

    public let types: [SingleSeatTypeResponseDTO]
}
