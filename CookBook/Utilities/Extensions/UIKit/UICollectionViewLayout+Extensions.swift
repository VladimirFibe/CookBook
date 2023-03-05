import UIKit

extension UICollectionViewLayout {
    static var rowLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = MainSection.allCases[sectionIndex]
            switch section {
            case .trending:
                let bannerItemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: bannerItemSize)
                bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.8),
                    heightDimension: .estimated(254)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            case .popular:
                let bannerItemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: bannerItemSize)
                bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(124),
                    heightDimension: .estimated(190)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            case .recent:
                let bannerItemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: bannerItemSize)
                bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(124),
                    heightDimension: .estimated(190)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            case .chef:
                let bannerItemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: bannerItemSize)
                bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(110),
                    heightDimension: .estimated(136)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            }
        }
    }
}
