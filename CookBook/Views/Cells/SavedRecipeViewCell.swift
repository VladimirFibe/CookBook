import UIKit
import Kingfisher

class SavedRecipeViewCell: UICollectionViewCell, SelfConfiguringCell {
    static var id = "SavedRecipeViewCell"
    
    func configure(with recipe: RecipeStruct) {
        imageDish.kf.setImage(with: URL(string: recipe.image))
        nameLabel.text = recipe.title
        if let image = UIImage(named: recipe.bookmark ? "BookmarkActive" : "BookmarkInactive") {
            bookmarkButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    private let imageDish: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Food")
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "How to make shawarma at home"
        label.font = .poppinsSemiBold16()
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
    
    private let ratingLabel: UIButton = {
        let button = UIButton()
        button.setTitle("5.0", for: .normal)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.backgroundColor = .darkGray.withAlphaComponent(0.7)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius =  16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "Creator")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let authorNameLabel: UILabel = {
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
    
    //Test
    @objc
    private func moreButtonTapped() { print("TAPPED") }
    
    private var labelsStackView = UIStackView()
    private var profileStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup views
    private func setupViews() {
        //backgroundColor = .green
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel, moreButton], axis: .horizontal, spacing: 10)
        profileStackView = UIStackView(arrangedSubviews: [authorImageView, authorNameLabel], axis: .horizontal, spacing: 5)
        contentView.addSubview(imageDish)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(labelsStackView)
        contentView.addSubview(bookmarkButton)
        contentView.addSubview(profileStackView)
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageDish.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageDish.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageDish.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageDish.heightAnchor.constraint(equalToConstant: 320),
            
            moreButton.widthAnchor.constraint(equalToConstant: 20),
            
            ratingLabel.topAnchor.constraint(equalTo: imageDish.topAnchor, constant: 10),
            ratingLabel.leadingAnchor.constraint(equalTo: imageDish.leadingAnchor, constant: 10),
            ratingLabel.widthAnchor.constraint(equalToConstant: 60),
            ratingLabel.heightAnchor.constraint(equalToConstant: 30),
            
            bookmarkButton.topAnchor.constraint(equalTo: imageDish.topAnchor, constant: 10),
            bookmarkButton.trailingAnchor.constraint(equalTo: imageDish.trailingAnchor, constant: -10),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 32),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 32),
        
            labelsStackView.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 15),
            labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            profileStackView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 10),
            profileStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
}
