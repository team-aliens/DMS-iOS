import Combine
import DataMappingModule
import ErrorModule

public protocol StudentsRepository {
    func signup(req: SignupRequestDTO) -> AnyPublisher<Void, DmsError>
    func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, DmsError>
    func checkDuplicateEmail(email: String) -> AnyPublisher<Void, DmsError>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, DmsError>
    func findID(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError>
    func checkExistGradeClassNumber(req: CheckExistGradeClassNumberRequestDTO) -> AnyPublisher<String, DmsError>
    func fetchMyProfile() -> AnyPublisher<MyProfileEntity, DmsError>
    func changeProfileImage(url: String) -> AnyPublisher<Void, DmsError>
}
