import NeedleFoundation
import UsersDomain
import UsersDomainInterface

public extension AppComponent {
    var remoteUsersDataSource: any RemoteUsersDataSource {
        shared {
//            RemoteUsersDataSourceStub()
            RemoteUsersDataSourceImpl(keychain: keychain)
        }
    }

    var usersRepository: any UsersRepository {
        shared {
            UsersRepositoryImpl(remoteUsersDataSource: remoteUsersDataSource)
        }
    }

    var changePasswordUseCase: any ChangePasswordUseCase {
        shared {
            ChangePasswordUseCaseImpl(usersRepository: usersRepository)
        }
    }

    var compareCurrentPasswordUseCase: any CompareCurrentPasswordUseCase {
        shared {
            CompareCurrentPasswordUseCaseImpl(usersRepository: usersRepository)
        }
    }
}
