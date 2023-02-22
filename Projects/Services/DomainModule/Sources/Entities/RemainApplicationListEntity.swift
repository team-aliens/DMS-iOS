import Foundation

public struct RemainApplicationListEntity: Equatable, Hashable {
    public init(
        selectedOption: String,
        remainOptions: [RemainOptionEntity]
    ) {
        self.selectedOption = selectedOption
        self.remainOptions = remainOptions
    }

    public let selectedOption: String
    public let remainOptions: [RemainOptionEntity]
}
