import DesignSystem
import SwiftUI
import Utility

struct CalendarSheetView: View {
    @Binding var selectedDate: Date
    var selectedDateString: String {
        "\(selectedDate.year)년 \(selectedDate.month)월"
    }
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack {
            HStack {
                Text(selectedDateString)
                    .dmsFont(.text(.extraLarge), color: .GrayScale.gray6)

                Spacer()
            }

            LazyVGrid(columns: columns) {
                ForEach(fetchAllDates(), id: \.id) { model in
                    VStack {
                        if model.day != -1 {
                            Text("\(model.day)")
                                .dmsFont(
                                    .text(.large),
                                    color: model.date.isSameDay(selectedDate) ? .GrayScale.gray1 : .GrayScale.gray6
                                )
                                .padding(8)
                                .background {
                                    if model.date.isSameDay(selectedDate) {
                                        Circle()
                                            .fill(Color.PrimaryVariant.primary)
                                            .frame(width: 32, height: 32)
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        Color.GrayScale.gray1
                    }
                    .onTapGesture {
                        selectedDate = model.date
                    }
                }
            }
            .padding(.bottom, 56)
        }
        .padding(.horizontal, 24)
    }

    func fetchAllDates() -> [CalendarSheetModel] {
        let calendar = Calendar.current
        var days = selectedDate.fetchAllDatesInCurrentMonth()
            .map { CalendarSheetModel(date: $0, day: $0.day) }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? .init())
        for _ in 0..<firstWeekday - 1 {
            days.insert(CalendarSheetModel(date: Date(), day: -1), at: 0)
        }
        return days
    }
}
