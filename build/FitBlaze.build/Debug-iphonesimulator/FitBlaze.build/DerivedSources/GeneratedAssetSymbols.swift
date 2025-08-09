import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "avatar" asset catalog image resource.
    static let avatar = DeveloperToolsSupport.ImageResource(name: "avatar", bundle: resourceBundle)

    /// The "avatar-10" asset catalog image resource.
    static let avatar10 = DeveloperToolsSupport.ImageResource(name: "avatar-10", bundle: resourceBundle)

    /// The "avatar-2" asset catalog image resource.
    static let avatar2 = DeveloperToolsSupport.ImageResource(name: "avatar-2", bundle: resourceBundle)

    /// The "avatar-3" asset catalog image resource.
    static let avatar3 = DeveloperToolsSupport.ImageResource(name: "avatar-3", bundle: resourceBundle)

    /// The "avatar-4" asset catalog image resource.
    static let avatar4 = DeveloperToolsSupport.ImageResource(name: "avatar-4", bundle: resourceBundle)

    /// The "avatar-5" asset catalog image resource.
    static let avatar5 = DeveloperToolsSupport.ImageResource(name: "avatar-5", bundle: resourceBundle)

    /// The "avatar-6" asset catalog image resource.
    static let avatar6 = DeveloperToolsSupport.ImageResource(name: "avatar-6", bundle: resourceBundle)

    /// The "avatar-7" asset catalog image resource.
    static let avatar7 = DeveloperToolsSupport.ImageResource(name: "avatar-7", bundle: resourceBundle)

    /// The "avatar-8" asset catalog image resource.
    static let avatar8 = DeveloperToolsSupport.ImageResource(name: "avatar-8", bundle: resourceBundle)

    /// The "avatar-9" asset catalog image resource.
    static let avatar9 = DeveloperToolsSupport.ImageResource(name: "avatar-9", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "avatar" asset catalog image.
    static var avatar: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar)
#else
        .init()
#endif
    }

    /// The "avatar-10" asset catalog image.
    static var avatar10: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar10)
#else
        .init()
#endif
    }

    /// The "avatar-2" asset catalog image.
    static var avatar2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar2)
#else
        .init()
#endif
    }

    /// The "avatar-3" asset catalog image.
    static var avatar3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar3)
#else
        .init()
#endif
    }

    /// The "avatar-4" asset catalog image.
    static var avatar4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar4)
#else
        .init()
#endif
    }

    /// The "avatar-5" asset catalog image.
    static var avatar5: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar5)
#else
        .init()
#endif
    }

    /// The "avatar-6" asset catalog image.
    static var avatar6: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar6)
#else
        .init()
#endif
    }

    /// The "avatar-7" asset catalog image.
    static var avatar7: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar7)
#else
        .init()
#endif
    }

    /// The "avatar-8" asset catalog image.
    static var avatar8: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar8)
#else
        .init()
#endif
    }

    /// The "avatar-9" asset catalog image.
    static var avatar9: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .avatar9)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "avatar" asset catalog image.
    static var avatar: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar)
#else
        .init()
#endif
    }

    /// The "avatar-10" asset catalog image.
    static var avatar10: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar10)
#else
        .init()
#endif
    }

    /// The "avatar-2" asset catalog image.
    static var avatar2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar2)
#else
        .init()
#endif
    }

    /// The "avatar-3" asset catalog image.
    static var avatar3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar3)
#else
        .init()
#endif
    }

    /// The "avatar-4" asset catalog image.
    static var avatar4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar4)
#else
        .init()
#endif
    }

    /// The "avatar-5" asset catalog image.
    static var avatar5: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar5)
#else
        .init()
#endif
    }

    /// The "avatar-6" asset catalog image.
    static var avatar6: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar6)
#else
        .init()
#endif
    }

    /// The "avatar-7" asset catalog image.
    static var avatar7: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar7)
#else
        .init()
#endif
    }

    /// The "avatar-8" asset catalog image.
    static var avatar8: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar8)
#else
        .init()
#endif
    }

    /// The "avatar-9" asset catalog image.
    static var avatar9: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .avatar9)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

