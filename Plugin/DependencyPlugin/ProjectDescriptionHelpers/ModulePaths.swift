import Foundation

// swiftlint: disable all
public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
}

public extension ModulePaths {
    enum Feature: String {
        case ApplyFeature
        case BaseFeature
        case FindIDFeature
        case HomeFeature
        case MainTabFeature
        case MyPageFeature
        case NoticeFeature
        case OutingApplyFeature
        case RemainApplyFeature
        case RenewalPasswordFeature
        case RootFeature
        case SigninFeature
        case SignupFeature
        case SplashFeature
        case StudyRoomFeature

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Domain: String {
        case NotificationDomain
        case UsersDomain
        case StudyRoomsDomain
        case StudentsDomain
        case SchoolDomain
        case OutingDomain
        case RemainsDomain
        case PointsDomain
        case NoticeDomain
        case MealDomain
        case FilesDomain
        case BaseDomain
        case AuthDomain

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Core: String {
        case Keychain

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Shared: String {
        case UtilityModule
        case GlobalThirdPartyLibrary
        case DesignSystem
        case WatchDesignSystem
        case WatchRestAPIModule
        
        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
}
