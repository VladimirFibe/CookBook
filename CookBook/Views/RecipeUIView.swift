import UIKit

class RecipeUIView: UICollectionViewCell {
    static let id = "RecipeUIView"
    //MARK: - let/var
    
    var recipeInfoStackView = UIStackView()
    
    var dishNameStackView = UIStackView()
    var creatorProfileStackView = UIStackView()
    var fullVideoUIView = FullVideoUIView()
    
    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.text = "How to sharwama at home"
        label.textColor = .neutral100
        label.font = .poppinsSemiBold14()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Union")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let сreatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "Creator")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let сreatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "By Zeelicious foods"
        label.font = .poppinsRegular12()
        label.textColor = .neutral50
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //MARK: - life cycle funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - flow funcs
    
    @objc private func moreButtonTapped() {
        print("moreButtonTapped")
    }
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension RecipeUIView {
    
    private func setupViews() {
        
        dishNameStackView = UIStackView(
            arrangedSubviews: [
                dishNameLabel,
                moreButton
            ],
            axis: .horizontal,
            spacing: 0
        )
        addSubview(dishNameStackView)
        
        creatorProfileStackView = UIStackView(
            arrangedSubviews: [
                сreatorImageView,
                сreatorNameLabel
            ],
            axis: .horizontal,
            spacing: 8
        )
        addSubview(creatorProfileStackView)
        
        recipeInfoStackView = UIStackView(
            arrangedSubviews: [
                fullVideoUIView,
                dishNameStackView,
                creatorProfileStackView
            ],
            axis: .vertical,
            spacing: 16
        )
        addSubview(recipeInfoStackView)
    }
}

//MARK: - extensions setConstraints

extension RecipeUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dishNameLabel.widthAnchor.constraint(equalToConstant: 220),
            dishNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            сreatorImageView.widthAnchor.constraint(equalToConstant: 32),
            сreatorImageView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            creatorProfileStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creatorProfileStackView.topAnchor.constraint(equalTo: dishNameStackView.bottomAnchor, constant: 12),
            creatorProfileStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recipeInfoStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            recipeInfoStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            recipeInfoStackView.heightAnchor.constraint(equalToConstant: 254)
        ])
        
    }
}
