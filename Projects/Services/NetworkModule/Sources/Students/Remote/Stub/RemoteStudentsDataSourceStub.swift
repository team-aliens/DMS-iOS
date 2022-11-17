import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public struct RemoteStudentsDataSourceStub: RemoteStudentsDataSource {
    public init() {}

    public func signup(req: SignupRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
                .eraseToAnyPublisher()
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
                .eraseToAnyPublisher()
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
                .eraseToAnyPublisher()
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError> {
        Just("abcdef@gmail.com").setFailureType(to: DmsError.self)
                .eraseToAnyPublisher()
    }

    public func checkExistGradeClassNumber(
        req: CheckExistGradeClassNumberRequestDTO
    ) -> AnyPublisher<String, DmsError> {
        Just("김범진").setFailureType(to: DmsError.self)
                .eraseToAnyPublisher()
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, DmsError> {
        Just(
            MyProfileEntity(
                schoolName: "광주소프트웨어마이스터고등학교",
                name: "변찬우",
                gcn: "2118",
                profileImageURL: URL(string: """
                                     https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.nave
r.net%2FMjAyMjExMDdfNjEg%2FMDAxNjY3Nzk5MTczMDg1.F93U6F1WhSWJbojBzO8OzLIVEmIbG24N3wSZo0ZPJc4g.pLD-fxrHiczl7lAExPrh-bqrk5GjLmwdiFLyzSM7Z1Ig.JPEG.dbdidna23%2F24.jpg&type=sc960_832
""")!,
                bonusPoint: 0,
                minusPoint: 24,
                phrase: "안녕하세요"
            )
        ).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func changeProfileImage(url: String) -> AnyPublisher<Void, DmsError> {
        Just(())
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
