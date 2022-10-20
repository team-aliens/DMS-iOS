import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct SchoolRepositoryImpl: SchoolRepository {
    private let remoteSchoolDataSource: any RemoteSchoolDataSource

    public init(remoteSchoolDataSource: any RemoteSchoolDataSource) {
        self.remoteSchoolDataSource = remoteSchoolDataSource
    }

    public func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        remoteSchoolDataSource.getSchoolList()
    }

    public func getSchoolQuestion(authCode: String) -> AnyPublisher<String, DmsError> {
        remoteSchoolDataSource.getSchoolQuestion(authCode: authCode)
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError> {
        remoteSchoolDataSource.checkSchoolQuestion(schoolID: schoolID, answer: answer)
    }

    public func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<String, DmsError> {
        remoteSchoolDataSource.checkSchoolCode(schoolID: schoolID, code: code)
    }
}
