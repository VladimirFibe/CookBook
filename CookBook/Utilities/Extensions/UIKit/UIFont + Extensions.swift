import UIKit

extension UIFont {
    
    //bold
    static func poppinsBold16() -> UIFont? {
        return UIFont.init(name: "Poppins-Bold", size: 16)
    }
    
    static func poppinsBold24() -> UIFont? {
        return UIFont.init(name: "Poppins-Bold", size: 24)
    }
    
    //semibold
    static func poppinsSemiBold14() -> UIFont? {
        return UIFont.init(name: "Poppins-SemiBold", size: 14)
    }
    
    static func poppinsSemiBold16() -> UIFont? {
        return UIFont.init(name: "Poppins-SemiBold", size: 16)
    }
    
    static func poppinsSemiBold20() -> UIFont? {
        return UIFont.init(name: "Poppins-SemiBold", size: 20)
    }
    
    //regular
    static func poppinsRegular12() -> UIFont? {
        return UIFont.init(name: "Poppins-Regular", size: 12)
    }
    
    static func poppinsRegular14() -> UIFont? {
        return UIFont.init(name: "Poppins-Regular", size: 14)
    }
    
    static func cooking(_ size: PoppinsSize, weight: PoppinsWeight) -> UIFont? {
        UIFont(name: weight.rawValue, size: size.rawValue)
    }
    
    static func poppins(_ size: CGFloat, weight: PoppinsWeight) -> UIFont? {
        UIFont(name: weight.rawValue, size: size)
    }
}

enum PoppinsWeight: String {
    case bold = "Poppins-Bold"
    case semibold = "Poppins-SemiBold"
    case regular = "Poppins-Regular"
}

enum PoppinsSize: CGFloat {
    case hero = 56
    case h1 = 48
    case h2 = 40
    case h3 = 32
    case h4 = 24
    case h5 = 20
    case body = 16
    case label = 14
    case small = 12
    case tiny = 10
}
