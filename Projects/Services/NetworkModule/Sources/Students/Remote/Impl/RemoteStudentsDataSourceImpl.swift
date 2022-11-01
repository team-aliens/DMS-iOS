import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteStudentsDataSourceImpl: BaseRemoteDataSource<StudentsAPI>, RemoteStudentsDataSource {
    public func signup(req: SignupRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.signup(req))
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, DmsError> {
        request(.checkDuplicateAccountID(id: id))
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, DmsError> {
        request(.checkDuplicateEmail(email: email))
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.renewalPassword(req))
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError> {
        request(.findID(req), dto: FindIDResponseDTO.self)
            .map(\.email)
            .eraseToAnyPublisher()
    }

    public func checkExistGradeClassNumber(req: CheckExistGradeClassNumberRequestDTO) -> AnyPublisher<String, DmsError> {
        request(.checkExistGradeClassNumber(req), dto: CheckAccountIDIsExistResponseDTO.self)
            .map(\.email)
            .eraseToAnyPublisher()
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, DmsError> {
        request(.fetchMyProfile, dto: FetchMyProfileResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
