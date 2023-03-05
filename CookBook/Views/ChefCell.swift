import SwiftUI

class ChefCell: UICollectionViewCell {
    static let id = "ChefCell"
    
    let imageView = RoundCornerImageView(image: UIImage(named: "Avatar"))
    let label = UILabel()

    lazy var stack = UIStackView(arrangedSubviews: [imageView, label])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        contentView.addSubview(stack)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        label.font = .cooking(.small, weight: .bold)
        label.numberOfLines = 1
        label.textColor = .neutral100
        label.textAlignment = .center

        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func configure(with title: String) {
        label.text = title
    }
}
