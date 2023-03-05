import UIKit

class PopularRecipeMainCell: UICollectionViewCell {
    static let id = "PopularRecipeMainCell"
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .neutral10
        view.layer.cornerRadius = 12
        return view
    }()
    
    let foodImage: RoundCornerImageView = {
        let foodImage = RoundCornerImageView(image: UIImage(named: "Food"))
        foodImage.contentMode = .scaleAspectFill
        foodImage.layer.masksToBounds = true
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        return foodImage
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Chicken and Vegetable wrap"
        nameLabel.font = .cooking(.label, weight: .bold)
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .neutral100
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let minutesLabel: UILabel = {
        let minutesLabel = UILabel()
        minutesLabel.text = "5 min"
        minutesLabel.font = .cooking(.small, weight: .bold)
        minutesLabel.textColor = .neutral100
        minutesLabel.translatesAutoresizingMaskIntoConstraints = false
        return minutesLabel
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = .cooking(.small, weight: .regular)
        label.textColor = .neutral30
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookMarkImage: UIImageView = {
        let bookMarkImage = UIImageView(image: UIImage(named: "BookmarkCircle"))
        bookMarkImage.translatesAutoresizingMaskIntoConstraints = false
        return bookMarkImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(backView)
        contentView.addSubview(foodImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(minutesLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(bookMarkImage)
        
        NSLayoutConstraint.activate([
            foodImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foodImage.widthAnchor.constraint(equalToConstant: 110),
            foodImage.heightAnchor.constraint(equalTo: foodImage.widthAnchor),
            backView.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: -53),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            minutesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            minutesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            
            timeLabel.leadingAnchor.constraint(equalTo: minutesLabel.leadingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: minutesLabel.topAnchor, constant: -4),
            
            bookMarkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bookMarkImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11)
        ])
    }
}
