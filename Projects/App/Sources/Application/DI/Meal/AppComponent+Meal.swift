import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteMealDataSource: any RemoteMealDataSource {
        RemoteMealDataSourceImpl(keychain: keychain)
    }

    var mealRepository: any MealRepository {
        MealRepositoryImpl(remoteMealDataSource: remoteMealDataSource)
    }

    var fetchMealListUseCase: any FetchMealListUseCase {
        FetchMealListUseCaseImpl(mealRepository: mealRepository)
    }
}
