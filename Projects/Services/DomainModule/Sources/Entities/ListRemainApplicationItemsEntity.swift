import Foundation

public struct ListRemainApplicationItemsEntity: Equatable, Hashable {
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
