import SwiftUI
import Kingfisher
class ChefCell: UICollectionViewCell, SelfConfiguringCell {
    static let id = "ChefCell"
    
    let imageView = RoundCornerImageView(image: UIImage(named: "Avatar")).apply {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
    }
    let label = UILabel().apply {
        $0.font = .cooking(.small, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .neutral100
        $0.textAlignment = .center
    }

    lazy var stack = UIStackView(arrangedSubviews: [imageView, label]).apply {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with recipe: RecipeStruct) {
        label.text = recipe.title
        imageView.kf.setImage(with: URL(string: recipe.image))
    }
}
