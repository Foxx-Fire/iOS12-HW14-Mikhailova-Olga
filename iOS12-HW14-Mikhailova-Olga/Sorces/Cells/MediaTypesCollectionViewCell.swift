//
//  MediaTypesCollectionViewCell.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 04.02.2024.
//

import UIKit

class MediaTypesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Media"
    
    lazy var mediaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.systemBlue
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
    
    func configureCell(categoryName: String, imageName: String) {
        categoryLabel.text = categoryName
        mediaImageView.image = UIImage(named: imageName)
    }
    
    private func setupHierarchy() {
        backgroundColor = .white
        addSubview(mediaImageView)
        addSubview(categoryLabel)
        addSubview(countLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mediaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mediaImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            mediaImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 6),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
    }
    
    //MARK: Configuration
    
    func configureCell(categoryName: String, count: String, imageName: String) {
        categoryLabel.text = categoryName
        countLabel.text = count
        mediaImageView.image = UIImage(systemName: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mediaImageView.image = nil
        self.categoryLabel.text = nil
        self.countLabel.text = nil
    }
}


