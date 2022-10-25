import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
        RemoteAuthDataSourceStub() // TODO: 퍼블리싱용 Stub, 테스트 서버 나오면 변경
//        RemoteAuthDataSourceImpl(keychain: keychain)
    }

    var authRepository: any AuthRepository {
        AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource)
    }

    var signinUseCase: any SigninUseCase {
        SigninUseCaseImpl(authRepository: authRepository)
    }

    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        VerifyAuthCodeUseCaseImpl(authRepository: authRepository)
    }

    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        SendAuthCodeUseCaseImpl(authRepository: authRepository)
    }

    var reissueTokenUseCase: any ReissueTokenUseCase {
        ReissueTokenCaseImpl(authRepository: authRepository)
    }

    var checkEmailExistByAccountIDUseCase: any CheckEmailExistByAccountIDUseCase {
        CheckEmailExistByAccountIDUseCaseImpl(authRepository: authRepository)
    }

    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        CheckAccountIDIsExistUseCaseImpl(authRepository: authRepository)
    }
}
