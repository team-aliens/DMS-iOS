import APIKit
import DomainModule
import Combine
import DataMappingModule
import ErrorModule
import Foundation

public protocol RemoteSchoolDataSource {
    func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError>
    func getSchoolQuestion(authCode: String) -> AnyPublisher<CheckSchoolQuestionEntity, DmsError>
    func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError>
    func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<CheckSchoolCodeEntity, DmsError>
}
