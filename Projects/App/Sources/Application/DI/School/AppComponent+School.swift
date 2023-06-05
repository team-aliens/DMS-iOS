import NeedleFoundation
import SchoolDomain
import SchoolDomainInterface

public extension AppComponent {
    var remoteSchoolDataSource: any RemoteSchoolDataSource {
        shared {
//            RemoteSchoolDataSourceStub()
            RemoteSchoolDataSourceImpl(keychain: keychain)
        }
    }

    var schoolRepository: any SchoolRepository {
        shared {
            SchoolRepositoryImpl(remoteSchoolDataSource: remoteSchoolDataSource)
        }
    }

    var fetchSchoolListUseCase: any FetchSchoolListUseCase {
        shared {
            FetchSchoolListUseCaseImpl(schoolRepository: schoolRepository)
        }
    }

    var fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase {
        shared {
            FetchSchoolQuestionUseCaseImpl(schoolRepository: schoolRepository)
        }
    }

    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase {
        shared {
            CheckSchoolQuestionUseCaseImpl(schoolRepository: schoolRepository)
        }
    }

    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase {
        shared {
            CheckSchoolCodeUseCaseImpl(schoolRepository: schoolRepository)
        }
    }
}
