import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteStudyRoomsDataSource: any RemoteStudyRoomsDataSource {
        RemoteStudyRoomsDataSourceImpl(keychain: keychain)
    }

    var studyRoomsRepository: any StudyRoomsRepository {
        StudyRoomsRepositoryImpl(remoteStudyRoomsDataSource: remoteStudyRoomsDataSource)
    }

    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase {
        FetchStudyAvailableTimeUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var fetchSeatTypesUseCase: any FetchSeatTypesUseCase {
        FetchSeatTypesUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase {
        FetchStudyRoomListUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase {
        FetchDetailStudyRoomUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase {
        ApplyStudyRoomSeatUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase {
        CancelStudyRoomSeatUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase {
        FetchMyStudyRoomAppItemsUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
    }

    var fetchStudyroomTimeListUseCase: any FetchStudyroomTimeListUseCase {
        shared {
            FetchStudyroomTimeListUseCaseImpl(studyRoomsRepository: studyRoomsRepository)
        }
    }
}
