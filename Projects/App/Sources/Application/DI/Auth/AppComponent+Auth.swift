import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
//            RemoteAuthDataSourceStub() // TODO: 퍼블리싱용 Stub, 테스트 서버 나오면 변경
            RemoteAuthDataSourceImpl(keychain: keychain)
        }
    }

    var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource)
        }
    }

    var signinUseCase: any SigninUseCase {
        shared {
            SigninUseCaseImpl(authRepository: authRepository)
        }
    }

    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        shared {
            VerifyAuthCodeUseCaseImpl(authRepository: authRepository)
        }
    }

    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        shared {
            SendAuthCodeUseCaseImpl(authRepository: authRepository)
        }
    }

    var reissueTokenUseCase: any ReissueTokenUseCase {
        shared {
            ReissueTokenCaseImpl(authRepository: authRepository)
        }
    }

    var checkEmailExistByAccountIDUseCase: any CheckEmailExistByAccountIDUseCase {
        shared {
            CheckEmailExistByAccountIDUseCaseImpl(authRepository: authRepository)
        }
    }

    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        shared {
            CheckAccountIDIsExistUseCaseImpl(authRepository: authRepository)
        }
    }
}
