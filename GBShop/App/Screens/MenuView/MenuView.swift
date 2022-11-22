//
//  MenuView.swift
//  GBShop
//
//  Created by Никита Мошенцев on 20.11.2022.
//

import UIKit

final class MenuView: UIView {
    
    //MARK: - Private properties
    private(set) lazy var searchHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var cityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("City", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.reuseID)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPullDownMenu()
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupPullDownMenu() {
        let cityClosure = { (action: UIAction) in
        }
        cityButton.menu = UIMenu(children: [
            UIAction(title: "Moscow", state: .on, handler:
                        cityClosure),
            UIAction(title: "Saint-Petersburg", handler: cityClosure),
            UIAction(title: "Kazan", handler: cityClosure)
        ])
        cityButton.showsMenuAsPrimaryAction = true
        cityButton.changesSelectionAsPrimaryAction = true
    }
    
    private func configureUI() {
        self.backgroundColor = .systemBackground
        addSearchView()
        addTableView()
    }
    
    private func addSearchView() {
        addSubview(searchHeader)
        searchHeader.addSubview(cityButton)
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchHeader.heightAnchor.constraint(equalToConstant: 40),
            searchHeader.topAnchor.constraint(equalTo: safeArea.topAnchor),
            searchHeader.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            searchHeader.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            cityButton.centerYAnchor.constraint(equalTo: searchHeader.centerYAnchor),
            cityButton.leadingAnchor.constraint(equalTo: searchHeader.leadingAnchor, constant: 20)
        ])
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchHeader.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}
