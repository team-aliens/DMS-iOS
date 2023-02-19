import Foundation

public struct FetchListRemainAppItemsResponseDTO: Decodable {
    public init(
        selectedOption: String,
        remainOptions: [RemainOptionResponseDTO]
    ) {
        self.selectedOption = selectedOption
        self.remainOptions = remainOptions
    }
    public let selectedOption: String
    public let remainOptions: [RemainOptionResponseDTO]
    
    enum CodingKeys: String, CodingKey {
        case selectedOption = "selected_option"
        case remainOptions = "remain_options"
    }
}
