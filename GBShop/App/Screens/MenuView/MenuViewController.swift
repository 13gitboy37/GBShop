//
//  MenuViewController.swift
//  GBShop
//
//  Created by Никита Мошенцев on 21.11.2022.
//

import UIKit

protocol MenuViewInput: AnyObject {
    func reloadTable(withProducts: [GoodInCatalogResult])
}

final class MenuViewController: UIViewController {
    
    //MARK: - Properties
    private var menuView: MenuView {
        guard let view = self.view as? MenuView else {
            let correctView = MenuView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: MenuViewPresenter?
    
    let requestFactory = RequestFactory()
    
    var tableAdapter: MenuTableAdapter?
    
    //MARK: - Init
    init(presenter: MenuViewPresenter, tableAdapter: MenuTableAdapter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.tableAdapter = tableAdapter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableAdapter?.categoryHeaderView.delegateCell = self
        menuView.tableView.delegate = tableAdapter
        menuView.tableView.dataSource = tableAdapter
        
        presenter?.loadCatalog()
    }
}

//MARK: - Menu View Input
extension MenuViewController: MenuViewInput {
    func reloadTable(withProducts: [GoodInCatalogResult]) {
        tableAdapter?.products = withProducts
        DispatchQueue.main.async {
            self.menuView.tableView.reloadData()
        }
    }
}

//MARK: - Category Cell Delegate
extension MenuViewController: CategoryCollectionCellOutput {
    
    func categoryCollectionCellDidSelect(_ category: Category) {
        
        guard let categories = tableAdapter?.categories else { return }
        
        for item in categories {
            if item.id == category.id {
                item.selected = true
            } else {
                item.selected = false
            }
        }
        
        tableAdapter?.categoryHeaderView.update(categories)
        
        var row = 0
        
        switch category.name {
        case "Ноутбуки": row = 0
        case "Мышки": row = 1
        case "Мониторы": row = 2
        case "Клавиатуры": row = 3
        case "Наушники": row = 4
        default: break
        }
        
        menuView.tableView.scrollToRow(at: IndexPath(row: row, section: 1), at: .top, animated: true)
    }
}
