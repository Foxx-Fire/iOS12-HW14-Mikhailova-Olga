//
//  HeaderSupplementaryView.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 04.02.2024.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    static let identifier = "Header"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
    
    private func setupHierarchy() {
        addSubview(headerLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
