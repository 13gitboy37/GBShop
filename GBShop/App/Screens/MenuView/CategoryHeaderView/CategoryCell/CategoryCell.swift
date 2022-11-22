//
//  CategoryCell.swift
//  GBShop
//
//  Created by Никита Мошенцев on 21.11.2022.
//

import UIKit

protocol CategoryCollectionCellOutput: AnyObject {
    
    func categoryCollectionCellDidSelect(_ category: Category)
}

final class CategoryCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    var delegate: CategoryCollectionCellOutput?
    
    var category: Category?
    
    static let reuseId = "CategoryCell"
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(tapCategoryAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupViews() {
        contentView.addSubview(categoryButton)
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    //MARK: - Public methods
    func configure(category: Category) {
        
        switch category.selected {
        case true:
            categoryButton.backgroundColor = .cyan
        case false:
            categoryButton.backgroundColor = .clear
        }
        
        categoryButton.setTitle(category.name, for: .normal)
        self.category = category
    }
    
    @objc func tapCategoryAction() {
        if let category = category {
            
            category.selected = true
            
            delegate?.categoryCollectionCellDidSelect(category)
        }
    }
}

