import SwiftUI

class RecentRecipeCell: UICollectionViewCell, SelfConfiguringCell {
    static let id = "RecentRecipeCell"
    
    let imageView = UIImageView(image: UIImage(named: "Food"))
    let label = UILabel()
    let authorLabel = UILabel()
    
    lazy var stack = UIStackView(arrangedSubviews: [imageView, label, authorLabel])
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
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true

        label.text = "Kelewele Ghanian Recipe"
        label.font = .poppins(14, weight: .semibold)
        label.font = .cooking(.label, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .label
        
        authorLabel.text = "By Anthony Bourdain"
        authorLabel.font = .poppins(10, weight: .regular)
        authorLabel.textColor = .secondaryLabel
        authorLabel.sizeToFit()
        
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(equalToConstant: 124),
            imageView.widthAnchor.constraint(equalTo: stack.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with recipe: Recipe) {
        imageView.kf.setImage(with: URL(string: recipe.image))
        label.text = recipe.title
    }
}
