import SwiftUI

class RoundCornerImageView: UIImageView {
    open override var frame: CGRect {
        didSet {
            setCorner(radius: self.radius)
        }
    }
    open override var bounds: CGRect {
        didSet {
            setCorner(radius: self.radius)
        }
    }
    private var radius: CGFloat?
    func setCorner(radius: CGFloat?) {
        let height = min(frame.width, frame.height)
        print(#function, height)
        if let radius = radius {
            self.radius = radius
            layer.cornerRadius = radius
        } else {
            layer.cornerRadius = height / 2
        }
    }
}
