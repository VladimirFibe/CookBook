import UIKit

class HalfRoundImageUIView: UICollectionViewCell {
    
    static let id = "HalfRoundImageUIView"
    
    let backgroundHalfImage: UIImageView = {
        let backgroundHalfImage = UIImageView(image: UIImage(named: "BackgroundHalfImage")?.withTintColor(UIColor(named: "Neutral10")!))
        backgroundHalfImage.contentMode = .scaleAspectFit
        return backgroundHalfImage
    }()
    
    let circleImage: UIImageView = {
        let circleImage = UIImageView(image: UIImage(named: "Circle"))
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        return circleImage
    }()
    
    let bookMarkImage: UIImageView = {
        let bookMarkImage = UIImageView(image: UIImage(named: "Bookmark"))
        bookMarkImage.translatesAutoresizingMaskIntoConstraints = false
        return bookMarkImage
    }()
    
    let foodImage: UIImageView = {
        let foodImage = UIImageView(image: UIImage(named: "Food"))
        foodImage.contentMode = .scaleAspectFill
        foodImage.layer.cornerRadius = 55
        foodImage.layer.masksToBounds = true
        return foodImage
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Ifly's Kitchen"
        nameLabel.font = .poppins(14, weight: .semibold)
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = .poppins(12, weight: .regular)
        label.textColor = UIColor(named: "Neutral30")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let minutesLabel: UILabel = {
        let minutesLabel = UILabel()
        minutesLabel.text = "5 min"
        minutesLabel.font = .poppins(12, weight: .semibold)
        minutesLabel.textColor = .black
        minutesLabel.translatesAutoresizingMaskIntoConstraints = false
        return minutesLabel
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
        contentView.addSubview(backgroundHalfImage)
        backgroundHalfImage.addSubview(circleImage)
        circleImage.addSubview(bookMarkImage)
        backgroundHalfImage.addSubview(minutesLabel)
        backgroundHalfImage.addSubview(timeLabel)
        backgroundHalfImage.addSubview(foodImage)
        backgroundHalfImage.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            foodImage.widthAnchor.constraint(equalToConstant: 110),
            foodImage.heightAnchor.constraint(equalToConstant: 110),

            backgroundHalfImage.topAnchor.constraint(equalTo: foodImage.centerYAnchor),
            backgroundHalfImage.bottomAnchor.constraint(equalTo: minutesLabel.bottomAnchor, constant: 11),


            circleImage.trailingAnchor.constraint(equalTo: backgroundHalfImage.trailingAnchor, constant: -11),
            circleImage.bottomAnchor.constraint(equalTo: backgroundHalfImage.bottomAnchor, constant: -11),
            circleImage.widthAnchor.constraint(equalToConstant: 24),
            circleImage.heightAnchor.constraint(equalToConstant: 24),
            
            bookMarkImage.centerXAnchor.constraint(equalTo: circleImage.centerXAnchor),
            bookMarkImage.centerYAnchor.constraint(equalTo: circleImage.centerYAnchor),
            bookMarkImage.widthAnchor.constraint(equalToConstant: 10.96),
            bookMarkImage.heightAnchor.constraint(equalToConstant: 13.67),
            
            nameLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundHalfImage.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: backgroundHalfImage.trailingAnchor, constant: -12),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.leadingAnchor.constraint(equalTo: backgroundHalfImage.leadingAnchor, constant: 12),
            timeLabel.bottomAnchor.constraint(equalTo: minutesLabel.topAnchor, constant: -4),
            
            minutesLabel.leadingAnchor.constraint(equalTo: backgroundHalfImage.leadingAnchor, constant: 12),
            minutesLabel.bottomAnchor.constraint(equalTo: backgroundHalfImage.bottomAnchor, constant: -11)
        ])
    }
}
