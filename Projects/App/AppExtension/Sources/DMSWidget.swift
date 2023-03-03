import SwiftUI
import WidgetKit

@main
struct DMSWidget: WidgetBundle {
    init() {
        registerProviderFactories()
    }

    var body: some Widget {
        WidgetComponent().makeWidget()
    }
}
