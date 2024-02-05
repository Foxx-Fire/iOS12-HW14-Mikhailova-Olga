//
//  MyAlbumCollectionViewCell.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 04.02.2024.
//

import UIKit

class MyAlbumCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Albums"
    
    lazy var albumsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        backgroundColor = .white
        addSubview(albumsImageView)
        addSubview(categoryLabel)
        addSubview(countLabel)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            albumsImageView.topAnchor.constraint(equalTo: topAnchor),
            albumsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            albumsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            albumsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: albumsImageView.bottomAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: albumsImageView.leadingAnchor, constant: 0),
            
            countLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 3),
            countLabel.leadingAnchor.constraint(equalTo: albumsImageView.leadingAnchor, constant: 0)
        ])
    }
    
    //MARK: Configuration
    
    func configureCell(categoryName: String, count: String, imageName: String) {
        categoryLabel.text = categoryName
        countLabel.text = count
        albumsImageView.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.albumsImageView.image = nil
        self.categoryLabel.text = nil
        self.countLabel.text = nil
    }
}


