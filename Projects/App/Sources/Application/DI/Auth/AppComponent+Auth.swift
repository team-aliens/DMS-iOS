import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
        RemoteAuthDataSourceStub()
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

    var checkEmailExistByAccountIDUseCase: any CheckEmailExistByAccountIDUseCase {
        CheckEmailExistByAccountIDUseCaseImpl(authRepository: authRepository)
    }

    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        CheckAccountIDIsExistUseCaseImpl(authRepository: authRepository)
    }
}
