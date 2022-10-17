import APIKit
import Combine
import DataMappingModule
import ErrorModule
import Foundation

public protocol RemoteAuthDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<Void, DmsError>
    func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError>
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError>
    func reissueToken() -> AnyPublisher<Void, DmsError>
    func emailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError>
    func checkAccountIDIsExist(id: String) -> AnyPublisher<String, DmsError>
}
