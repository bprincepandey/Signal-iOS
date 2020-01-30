//
//  Copyright (c) 2020 Open Whisper Systems. All rights reserved.
//

import Foundation

@objc
public class DarwinNotificationName: NSObject, ExpressibleByStringLiteral {
    @objc public static let sdsCrossProcess: DarwinNotificationName = "org.signal.sdscrossprocess"
    @objc public static let nseDidReceiveNotification: DarwinNotificationName = "org.signal.nseDidReceiveNotification"
    @objc public static let mainAppHandledNotification: DarwinNotificationName = "org.signal.mainAppHandledNotification"

    public typealias StringLiteralType = String

    private let stringValue: String

    @objc
    var cString: UnsafePointer<Int8> {
        return stringValue.withCString { $0 }
    }

    @objc
    var isValid: Bool {
        return stringValue.isEmpty == false
    }

    public required init(stringLiteral value: String) {
        stringValue = value
    }

    @objc
    public init(_ name: String) {
        stringValue = name
    }

    public override func isEqual(_ object: Any?) -> Bool {
        guard let otherName = object as? DarwinNotificationName else { return false }
        return otherName.stringValue == stringValue
    }

    public override var hash: Int {
        return stringValue.hashValue
    }
}
