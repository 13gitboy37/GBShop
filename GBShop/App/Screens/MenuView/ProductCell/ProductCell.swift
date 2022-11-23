//
//  ProductCell.swift
//  GBShop
//
//  Created by Никита Мошенцев on 21.11.2022.
//

import UIKit

class ProductCell: UITableViewCell {
    
    //MARK: - Static properties
    static let reuseID = "ProductCell"
    
    //MARK: - Private properties
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var priceLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        return button
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupViews() {
        addSubview(productImageView)
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(priceLabel)
    }
    
    //MARK: - Methods
    func configure(_ model: GoodInCatalogResult) {
        productImageView.image = UIImage(systemName: model.imageUrl)
        nameLabel.text = model.productName
        priceLabel.setTitle(" " + "\(model.price)" + " ", for: .normal)
        
    }
}

//MARK: - Layout
extension ProductCell {
    struct Layout {
        static let productImageWidth: CGFloat = 100
        static let productImageHeight: CGFloat = 90
        static let space: CGFloat = 10
        static let priceWidth: CGFloat = 80
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: Layout.productImageWidth),
            productImageView.heightAnchor.constraint(equalToConstant: Layout.productImageHeight),
            
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: Layout.space),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.widthAnchor.constraint(equalToConstant: Layout.priceWidth)
        ])
    }
}

