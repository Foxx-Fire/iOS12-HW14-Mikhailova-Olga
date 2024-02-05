//
//  MediaTypesTabBarViewController.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 03.02.2024.
//

import UIKit

class AlbumsTabBarViewController: UIViewController {
    
    //MARK: - Constants
    var sections = Elements.shared.elements
    
    //MARK: - Outlets
    
    private lazy var  collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        // collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyAlbumCollectionViewCell.self, forCellWithReuseIdentifier: MyAlbumCollectionViewCell.identifier)
        collectionView.register(SharedAlbumsCollectionViewCell.self, forCellWithReuseIdentifier: SharedAlbumsCollectionViewCell.identifier)
        collectionView.register(MediaTypesCollectionViewCell.self, forCellWithReuseIdentifier: MediaTypesCollectionViewCell.identifier)
        collectionView.register(UtilitiesCollectionViewCell.self, forCellWithReuseIdentifier: UtilitiesCollectionViewCell.identifier)
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionView.collectionViewLayout = createLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

//MARK: - CollectionViewLayout

extension AlbumsTabBarViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            
            switch section {
            case .albums(_):
                return self.createAlbumsSection()
            case .shared(_):
                return self.createSharedSection()
            case .media(_):
                return self.createMediaSection()
            case .utilities(_):
                return self.createUtilitiesSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpasing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpasing
        section.boundarySupplementaryItems = supplementaryItems
        
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    private func createAlbumsSection() -> NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 1, bottom: 40, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                               heightDimension: .fractionalWidth(1.3))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 30, trailing: 0)
        
        let layoutSection = createLayoutSection(group: layoutGroup,
                                                behavior: .groupPaging,
                                                interGroupSpasing: 10,
                                                supplementaryItems: [self.supplementaryHeaderItem()])
        layoutSection.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        return  layoutSection
    }
    
    private func createSharedSection() ->  NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 10, bottom: 40, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalWidth(0.6))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        
        let section = self.createLayoutSection(group: layoutGroup,
                                               behavior: .none,
                                               interGroupSpasing: 10, supplementaryItems: [self.supplementaryHeaderItem()])
        section.contentInsets = .init(top: 20, leading: 2, bottom: 20, trailing: 10)
        
        return section
    }
    
    private func createMediaSection() ->  NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 1, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 0, bottom: 20, trailing: 0)
        let section = self.createLayoutSection(group: layoutGroup,
                                               behavior: .none,
                                               interGroupSpasing: 1, supplementaryItems: [self.supplementaryHeaderItem()])
        section.contentInsets = .init(top: 20, leading: 0, bottom: 20, trailing: 10)
        return section
    }
    
    private func createUtilitiesSection() ->  NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 1, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 0, bottom: 20, trailing: 0)
        let section = self.createLayoutSection(group: layoutGroup,
                                               behavior: .none,
                                               interGroupSpasing: 1, supplementaryItems: [self.supplementaryHeaderItem()])
        section.contentInsets = .init(top: 20, leading: 0, bottom: 20, trailing: 10)
        return section
    }
}

// Extensions ViewController DataSource

extension AlbumsTabBarViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .albums(let albums) :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumCollectionViewCell.identifier, for: indexPath) as? MyAlbumCollectionViewCell else {return UICollectionViewCell()}
            cell.configureCell(categoryName: albums[indexPath.item].title, count: albums[indexPath.item].subtitle, imageName: albums[indexPath.item].image)
            cell.backgroundColor = .systemTeal
            
            return cell
        case .shared(let shared):
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: SharedAlbumsCollectionViewCell.identifier, for: indexPath) as? SharedAlbumsCollectionViewCell else {return UICollectionViewCell()}
            cell.configureCell(categoryName: shared[indexPath.item].title, count: shared[indexPath.item].subtitle,imageName: shared[indexPath.item].image)
            
            return cell
        case .media(let media):
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesCollectionViewCell.identifier, for: indexPath) as? MediaTypesCollectionViewCell else {return UICollectionViewCell()}
            cell.configureCell(categoryName: media[indexPath.item].title, count: media[indexPath.item].subtitle, imageName: media[indexPath.item].image)
            
            return cell
        case .utilities(let utilities):
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesCollectionViewCell.identifier, for: indexPath) as? UtilitiesCollectionViewCell else {return UICollectionViewCell()}
            cell.configureCell(categoryName: utilities[indexPath.item].title, count: utilities[indexPath.item].subtitle, imageName: utilities[indexPath.item].image)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSupplementaryView.identifier, for: indexPath) as? HeaderSupplementaryView
            guard let header = header else {return UICollectionReusableView()}
            header.headerLabel.font = .systemFont(ofSize: 22, weight: .bold)
            header.headerLabel.textColor = .black
            header.configureHeader(categoryName: sections[indexPath.section].title)
            
            return header
            
        default:
            return UICollectionReusableView()
        }
    }
}
