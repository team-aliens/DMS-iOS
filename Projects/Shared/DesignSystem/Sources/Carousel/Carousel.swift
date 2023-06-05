import SwiftUI

public struct Carousel<Content: View>: View {
    @GestureState var screenDrag: Float = 0.0
    @EnvironmentObject var UIState: UIStateModel
    let items: Content
    let numberOfItems: CGFloat
    let spacing: CGFloat
    let widthOfHiddenCards: CGFloat
    let totalSpacing: CGFloat
    let cardWidth: CGFloat

    public init(
        numberOfItems: CGFloat,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        @ViewBuilder _ items: () -> Content
    ) {
        self.items = items()
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.widthOfHiddenCards = widthOfHiddenCards
        self.totalSpacing = (numberOfItems - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2)
    }

    public var body: some View {
        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
        let leftPadding = widthOfHiddenCards + spacing
        let totalMovement = cardWidth + spacing

        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)

        var calcOffset = Float(activeOffset)

        if calcOffset != Float(nextOffset) {
            calcOffset = Float(activeOffset) + UIState.screenDrag
        }

        return DeferView {
            HStack(alignment: .center, spacing: spacing) { items }
        }
        .offset(x: CGFloat(calcOffset), y: 0)
        .gesture(
            DragGesture()
                .updating($screenDrag) { value, state, _ in
                    state = Float(value.translation.width)
                }
                .onEnded { value in
                    self.UIState.screenDrag = 0

                    if (value.translation.width < -50) &&  self.UIState.activeCard < Int(numberOfItems) - 1 {
                        self.UIState.activeCard += 1
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }

                    if (value.translation.width > 50) && self.UIState.activeCard > 0 {
                        self.UIState.activeCard -= 1
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }
                }
        )
        .onChange(of: screenDrag) { newValue in
            UIState.screenDrag = newValue
        }
    }
}
