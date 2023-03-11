import UIKit

// MARK: - Create ...
extension MainViewController {
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout =  UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = MainSection.allCases[sectionIndex]
            switch section {
            case .trending: return self.createTrendingSection()
            case .popular: return self.createPopularSection()
            case .recent: return self.createRecentSection()
            case .chef:return self.createTeamSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    func createTrendingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(254))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        section.boundarySupplementaryItems = [createSectionHeader()]
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createPopularSection() -> NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createRecentSection() -> NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createTeamSection() -> NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(54)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        return layoutSectionHeader
    }
}
