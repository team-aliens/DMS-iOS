import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteMealDataSource: any RemoteMealDataSource {
        shared {
//            RemoteMealDataSourceStub()
            RemoteMealDataSourceImpl(keychain: keychain)
        }
    }

    var mealRepository: any MealRepository {
        shared {
            MealRepositoryImpl(remoteMealDataSource: remoteMealDataSource)
        }
    }

    var fetchMealListUseCase: any FetchMealListUseCase {
        shared {
            FetchMealListUseCaseImpl(mealRepository: mealRepository)
        }
    }
}
