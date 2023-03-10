import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    let title = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        title.textColor = .neutral100
        title.font = .cooking(.h5, weight: .bold)
        title.text = "Title"
        let stackView = UIStackView(arrangedSubviews: [title])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
