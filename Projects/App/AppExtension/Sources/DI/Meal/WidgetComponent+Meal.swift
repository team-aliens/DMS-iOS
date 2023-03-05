import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

extension WidgetComponent {
    var remoteMealDataSource: any RemoteMealDataSource {
        shared {
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
