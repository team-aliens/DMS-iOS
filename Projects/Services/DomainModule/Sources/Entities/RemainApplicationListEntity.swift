import Foundation

public struct RemainApplicationListEntity: Equatable, Hashable {
    public init(
        remainOptions: [RemainOptionEntity]
    ) {
        self.remainOptions = remainOptions
    }

    public let remainOptions: [RemainOptionEntity]
}
