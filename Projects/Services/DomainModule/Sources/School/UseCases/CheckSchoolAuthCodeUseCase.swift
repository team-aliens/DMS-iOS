import Combine
import DataMappingModule
import ErrorModule

public protocol CheckSchoolAuthCodeUseCase {
    func execute(schoolID: String, code: String) -> AnyPublisher<CheckSchoolCodeResponseDTO, DmsError>
}
