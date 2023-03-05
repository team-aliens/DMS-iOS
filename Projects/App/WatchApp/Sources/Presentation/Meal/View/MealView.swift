import SwiftUI
import WatchDesignSystem

struct MealView: View {
    @StateObject var container: MVIContainer<MealIntentProtocol, MealStateProtocol>
    private var intent: any MealIntentProtocol { container.intent }
    private var state: any MealStateProtocol { container.model }

    var body: some View {
        ZStack {
            if state.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }

            if let meal = state.meal {
                List {
                    mealView(displayMeal: .breakfast, meals: meal.breakfast)
                    mealView(displayMeal: .lunch, meals: meal.lunch)
                    mealView(displayMeal: .dinner, meals: meal.dinner)
                }
                .listStyle(.carousel)
            } else {
                Text("아이폰에서 먼저 로그인을 해주세요!")
            }
        }
        .onAppear {
            intent.onAppear()
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
                    .dmsFont(.etc(.button))
            }

            ForEach(meals, id: \.self) { meal in
                Text(meal)
                    .dmsFont(.etc(.caption))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8)
        .cornerRadius(11)
    }
}
