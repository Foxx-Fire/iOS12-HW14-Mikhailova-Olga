//
//  SharedAlbumsCollectionViewCell.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 04.02.2024.
//

import UIKit

class SharedAlbumsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Shared"
    
    lazy var sharedImageView: UIImageView = {
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
        addSubview(sharedImageView)
        addSubview(categoryLabel)
        addSubview(countLabel)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            sharedImageView.topAnchor.constraint(equalTo: topAnchor),
            sharedImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sharedImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sharedImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: sharedImageView.bottomAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: sharedImageView.leadingAnchor, constant: 5),
            
            countLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            countLabel.leadingAnchor.constraint(equalTo: sharedImageView.leadingAnchor, constant: 5)
        ])
    }
    
    //MARK: Configuration
    
    func configureCell(categoryName: String, count: String, imageName: String) {
        categoryLabel.text = categoryName
        countLabel.text = count
        sharedImageView.image = UIImage(named: imageName)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.sharedImageView.image = nil
        self.categoryLabel.text = nil
        self.countLabel.text = nil
    }
}


