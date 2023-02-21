import DataMappingModule
import DomainModule

public extension FetchRemainAppListResponseDTO {
    func toDomain() -> RemainApplicationListEntity {
        RemainApplicationListEntity(
            selectedOption: selectedOption,
            remainOptions: remainOptions.map { $0.toDomain() }
        )
    }
}

public extension RemainOptionResponseDTO {
    func toDomain() -> RemainOptionEntity {
        RemainOptionEntity(
            id: id,
            title: title,
            description: description
        )
    }
}
