import Foundation

public struct SelectedRemainOptionEntity: Equatable, Hashable {
    public init(
        selectedEntity: RemainOptionEntity,
        isShowingDetail: Bool
    ) {
        self.selectedEntity = selectedEntity
        self.isShowingDetail = isShowingDetail
    }

    public var selectedEntity: RemainOptionEntity
    public var isShowingDetail: Bool
}
