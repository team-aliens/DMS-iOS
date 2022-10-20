import Combine
import DataMappingModule
import ErrorModule

public protocol CheckSchoolAuthCodeUseCase {
    func execute(schoolID: String, schoolCode: String) -> AnyPublisher<CheckSchoolAuthCodeResponseDTO, DmsError>
}
