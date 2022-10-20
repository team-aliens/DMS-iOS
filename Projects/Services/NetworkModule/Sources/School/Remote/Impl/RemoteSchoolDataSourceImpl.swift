import APIKit
import Combine
import DataMappingModule
import ErrorModule
import NetworkModule

public final class RemoteSchoolDataSourceImpl: BaseRemoteDataSource<SchoolAPI>, RemoteSchoolDataSource {
    public func getSchoolList() -> AnyPublisher<FetchSchoolListResponseDTO, ErrorModule.DmsError> {
        request(.getSchoolList, dto: FetchSchoolListResponseDTO.self)
    }

    public func getSchoolQuestion(authCode: String) -> AnyPublisher<CheckSchoolQuestionResponseDTO, ErrorModule.DmsError> {
        request(.getSchoolQuestion(authCode: authCode), dto: CheckSchoolQuestionResponseDTO.self)
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, ErrorModule.DmsError> {
        request(.checkSchoolQuestion(schoolID: schoolID, answer: answer))
    }

    public func checkSchoolAuthCode(schoolID: String, code: String) -> AnyPublisher<CheckSchoolAuthCodeResponseDTO, ErrorModule.DmsError> {
        request(.checkSchoolAuthCode(schoolID: schoolID, code: code), dto: CheckSchoolAuthCodeResponseDTO.self)
    }

}
