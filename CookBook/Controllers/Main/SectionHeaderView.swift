import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    let title = UILabel()
    let button = UIButton(type: .system)
    let arrowImage = UIImage(named: "Arrow")

    override init(frame: CGRect) {
        super.init(frame: frame)

        title.textColor = .neutral100
        title.font = .cooking(.h5, weight: .bold)
        title.text = "Title"

        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("See all", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.semanticContentAttribute = .forceRightToLeft
        button.tintColor = .neutral100
        button.setImage(arrowImage, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -12)

        let stackView = UIStackView(arrangedSubviews: [title, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        button.setTitleColor(.primary50, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTapButton() {
    
    }
}
