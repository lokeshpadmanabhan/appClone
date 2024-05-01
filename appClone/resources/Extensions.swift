//
//  Extensions.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import UIKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    public var height: CGFloat {
        return frame.size.height
    }
    public var top: CGFloat {
        return frame.origin.y
    }
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    public var left: CGFloat {
        return frame.origin.x
    }
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
}
extension String {
     func safedatabasekey() -> String {
         return self.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")

    }
}
