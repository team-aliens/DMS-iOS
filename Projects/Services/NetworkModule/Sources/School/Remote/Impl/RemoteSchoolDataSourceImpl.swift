import APIKit
import DomainModule
import Combine
import DataMappingModule
import ErrorModule

public final class RemoteSchoolDataSourceImpl: BaseRemoteDataSource<SchoolAPI>, RemoteSchoolDataSource {
    public func fetchSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        request(.fetchSchoolList, dto: FetchSchoolListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchSchoolQuestion(authCode: String) -> AnyPublisher<String, DmsError> {
        request(.fetchSchoolQuestion(authCode: authCode), dto: CheckSchoolQuestionResponseDTO.self)
            .map { $0.question }
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError> {
        request(.checkSchoolQuestion(schoolID: schoolID, answer: answer))
    }

    public func checkSchoolCode(code: String) -> AnyPublisher<String, DmsError> {
        request(.checkSchoolCode(code: code), dto: CheckSchoolCodeResponseDTO.self)
            .map { $0.schoolID }
            .eraseToAnyPublisher()
    }

}
