import UIKit

extension UICollectionViewLayout {
    static var rowLayout: UICollectionViewLayout {
        let layout =  UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = MainSection.allCases[sectionIndex]
            switch section {
            case .trending:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(254))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
                
                let section = NSCollectionLayoutSection(group: layoutGroup)
                section.boundarySupplementaryItems = [header]
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                return section
            case .popular:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: itemSize)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(150),
                    heightDimension: .absolute(231)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.boundarySupplementaryItems = [header]
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                return section
            case .recent:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(124),
                    heightDimension: .absolute(190)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [header]
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                return section
            case .chef:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let bannerItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bannerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let bannerGroupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(110),
                    heightDimension: .absolute(136)
                )
                let bannerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bannerGroupSize, subitems: [bannerItem])
                
                let section = NSCollectionLayoutSection(group: bannerGroup)
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [header]
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                return section
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    static var header: NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(54)
        )
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
    }
}
