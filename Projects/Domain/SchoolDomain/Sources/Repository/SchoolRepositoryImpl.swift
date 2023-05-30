import Combine
import SchoolDomainInterface

public struct SchoolRepositoryImpl: SchoolRepository {
    private let remoteSchoolDataSource: any RemoteSchoolDataSource

    public init(remoteSchoolDataSource: any RemoteSchoolDataSource) {
        self.remoteSchoolDataSource = remoteSchoolDataSource
    }

    public func fetchSchoolList() -> AnyPublisher<[SchoolEntity], Error> {
        remoteSchoolDataSource.fetchSchoolList()
    }

    public func fetchSchoolQuestion(schoolID: String) -> AnyPublisher<String, Error> {
        remoteSchoolDataSource.fetchSchoolQuestion(schoolID: schoolID)
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, Error> {
        remoteSchoolDataSource.checkSchoolQuestion(schoolID: schoolID, answer: answer)
    }

    public func checkSchoolCode(code: String) -> AnyPublisher<String, Error> {
        remoteSchoolDataSource.checkSchoolCode(code: code)
    }
}
