import APIKit
import DomainModule
import Combine
import DataMappingModule
import ErrorModule

public final class RemoteSchoolDataSourceImpl: BaseRemoteDataSource<SchoolAPI>, RemoteSchoolDataSource {
    public func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        request(.fetchSchoolList, dto: FetchSchoolListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func getSchoolQuestion(authCode: String) -> AnyPublisher<CheckSchoolQuestionEntity, DmsError> {
        request(.fetchSchoolQuestion(authCode: authCode), dto: CheckSchoolQuestionResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, ErrorModule.DmsError> {
        request(.checkSchoolQuestion(schoolID: schoolID, answer: answer))
    }

    public func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<CheckSchoolCodeEntity, DmsError> {
        request(.checkSchoolCode(schoolID: schoolID, code: code), dto: CheckSchoolCodeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

}
