import Combine
import DomainModule
import Foundation

public final class DmsFeaturesObject: ObservableObject {
    public let features: DmsFeatures

    public init(features: DmsFeatures) {
        self.features = features
    }
}
