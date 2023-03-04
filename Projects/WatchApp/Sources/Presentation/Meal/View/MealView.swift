import SwiftUI
import WatchDesignSystem

struct MealView: View {
    @StateObject var container: MVIContainer<MealIntentProtocol, MealStateProtocol>
    private var intent: any MealIntentProtocol { container.intent }
    private var state: any MealStateProtocol { container.model }

    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(.circular)

            TabView {
                Group {
                    if let meal = state.meal {
                        mealView(displayMeal: .breakfast, meals: meal.breakfast)
                        mealView(displayMeal: .lunch, meals: meal.lunch)
                        mealView(displayMeal: .dinner, meals: meal.dinner)
                    }
                }
                .rotationEffect(Angle(degrees: -90))
            }
            .tabViewStyle(.page)
            .rotationEffect(Angle(degrees: 90))
        }
    }

    @ViewBuilder
    func mealView(displayMeal: DisplayMealPart, meals: [String]) -> some View {
        VStack {
            HStack(spacing: 4) {
                Image(systemName: displayMeal.systemName)
                    .resizable()
                    .frame(width: 16, height: 16)

                Text(displayMeal.display)
                    .dmsFont(.etc(.caption))
            }

            ForEach(meals, id: \.self) { meal in
                Text(meal)
                    .dmsFont(.etc(.caption))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8)
    }
}
