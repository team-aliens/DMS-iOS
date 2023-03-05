import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule
import DatabaseModule

public extension AppComponent {
    var localAuthDataSource: any LocalAuthDataSource {
        shared {
            LocalAuthDataSourceImpl(keychain: keychain)
        }
    }
    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
            RemoteAuthDataSourceImpl(keychain: keychain)
        }
    }

    var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(
                remoteAuthDataSource: remoteAuthDataSource,
                localAuthDataSource: localAuthDataSource
            )
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

    var logoutUseCase: any LogoutUseCase {
        shared {
            LogoutUseCaseImpl(authRepository: authRepository)
        }
    }
}
