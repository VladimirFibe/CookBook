import UIKit

final class CustomTabBar: UITabBar {
    var didTabButton: (() -> Void)?
    
    lazy var middleButton: UIButton = {
        $0.frame.size = CGSize(width: 82, height: 82)
        $0.setImage(UIImage(named: "middleButton"), for: .normal)
        $0.tintColor = .neutral100
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(middleButtonAction), for: .primaryActionTriggered)
        self.addSubview($0)
        return $0
    }(UIButton())
    
    private var shapeLayer: CALayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
    }
    
    override func draw(_ rect: CGRect) {
        self.setupAddShape()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        middleButton.center = CGPoint(x: frame.width / 2, y: 5)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        
        return self.middleButton.frame.contains(point) ? self.middleButton : super.hitTest(point, with: event)
    }
    
    private func setupAddShape() {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = setupCreatePathCircle()
            shapeLayer.strokeColor = UIColor.lightGray.cgColor
            shapeLayer.fillColor = UIColor.white.cgColor
            shapeLayer.lineWidth = 0.5
            if let oldShapeLayer = self.shapeLayer {
                self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
            } else {
                self.layer.insertSublayer(shapeLayer, at: 0)
            }

            self.shapeLayer = shapeLayer
    }
    
    private func setupCreatePathCircle() -> CGPath {

        let radius: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - radius * 2), y: 0))
        path.addArc(
            withCenter: CGPoint(x: centerWidth, y: 0),
            radius: radius, startAngle: CGFloat(180).degreesToRadians,
            endAngle: CGFloat(0).degreesToRadians,
            clockwise: false
        )
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
    
    @objc func middleButtonAction(_ sender: UIButton) {
        didTabButton?()
        print(#function)
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
