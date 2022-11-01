import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteStudentsDataSource: any RemoteStudentsDataSource {
        RemoteStudentsDataSourceStub()
    }

    var studentsRepository: any StudentsRepository {
        StudentsRepositoryImpl(remoteStudentsDataSource: remoteStudentsDataSource)
    }

    var signupUseCase: any SignupUseCase {
        SignupUseCaseImpl(studentsRepository: studentsRepository)
    }

    var checkDuplicateAccountIDUseCase: any CheckDuplicateAccountIDUseCase {
        CheckDuplicateAccountIDUseCaseImpl(studentsRepository: studentsRepository)
    }

    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase {
        CheckDuplicateEmailUseCaseImpl(studentsRepository: studentsRepository)
    }

    var renewalPasswordUseCase: any RenewalPasswordUseCase {
        RenewalPasswordUseCaseImpl(studentsRepository: studentsRepository)
    }

    var findIDUseCase: any FindIDUseCase {
        FindIDUseCaseImpl(studentsRepository: studentsRepository)
    }

    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase {
        CheckExistGradeClassNumberUseCaseImpl(studentsRepository: studentsRepository)
    }

    var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        FetchMyProfileUseCaseImpl(studentsRepository: studentsRepository)
    }
}
