import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct StudentsRepositoryImpl: StudentsRepository {
    private let remoteStudentsDataSource: any RemoteStudentsDataSource

    public init(remoteStudentsDataSource: any RemoteStudentsDataSource) {
        self.remoteStudentsDataSource = remoteStudentsDataSource
    }

    public func signup(req: SignupRequestDTO) -> AnyPublisher<Void, DmsError> {
        remoteStudentsDataSource.signup(req: req)
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, DmsError> {
        remoteStudentsDataSource.checkDuplicateAccountID(id: id)
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, DmsError> {
        remoteStudentsDataSource.checkDuplicateEmail(email: email)
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        remoteStudentsDataSource.renewalPassword(req: req)
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError> {
        remoteStudentsDataSource.findID(req: req)
    }

    public func checkExistGradeClassNumber(
        req: CheckExistGradeClassNumberRequestDTO
    ) -> AnyPublisher<String, DmsError> {
        remoteStudentsDataSource.checkExistGradeClassNumber(req: req)
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, DmsError> {
        remoteStudentsDataSource.fetchMyProfile()
    }

    public func changeProfileImage(url: String) -> AnyPublisher<Void, DmsError> {
        remoteStudentsDataSource.changeProfileImage(url: url)
    }
}
