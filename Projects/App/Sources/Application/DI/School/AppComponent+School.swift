import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteSchoolDataSource: any RemoteSchoolDataSource {
        RemoteSchoolDataSourceStub()
    }

    var schoolRepository: any SchoolRepository {
        SchoolRepositoryImpl(remoteSchoolDataSource: remoteSchoolDataSource)
    }

    var fetchSchoolListUseCase: any FetchSchoolListUseCase {
        FetchSchoolListUseCaseImpl(schoolRepository: schoolRepository)
    }

    var fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase {
        FetchSchoolQuestionUseCaseImpl(schoolRepository: schoolRepository)
    }

    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase {
        CheckSchoolQuestionUseCaseImpl(schoolRepository: schoolRepository)
    }

    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase {
        CheckSchoolCodeUseCaseImpl(schoolRepository: schoolRepository)
    }
}
