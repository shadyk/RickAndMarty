//
//  Created by Shady
//  All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class CharactersListViewController: UIViewController{
    
    private var controller: CharacterListController?
    private var searchController: SearchController?
    private var tableModel = [CharacterListCellController]() {
        didSet { tableView.reloadData() }
    }
    
    private lazy var tableView: UITableView = {
        let t = UITableView(frame: .zero, style: .grouped)
        t.backgroundColor = .white
        t.rowHeight = UITableView.automaticDimension
        t.estimatedRowHeight = 1
        t.separatorStyle = .none
        t.showsVerticalScrollIndicator = false
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(controller: CharacterListController, searchController: SearchController){
        self.init()
        self.controller = controller
        self.searchController = searchController
        setupInterface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearch()
        controller?.loadCharacters(success: { [weak self] model in
            self?.tableModel = model
        }, fail: { [weak self] in
            self?.showAlert(message: $0)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    
    private func setupInterface(){
        view.addSubview(tableView)
        title = Localizable.LIST_TITLE
        tableView.register(CharacterListTableCell.self, forCellReuseIdentifier: "CharacterListTableCell")
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupSearch(){
        searchController?.searchResultsUpdater = self
        navigationItem.searchController = searchController!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersListViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.didSelect(nav: self.navigationController!, character: cellController(forRowAt: indexPath).viewModel!)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellController = cellController(forRowAt: indexPath)
        return cellController.view(in: tableView)
    }
    
    private func cellController(forRowAt indexPath: IndexPath) -> CharacterListCellController {
        return tableModel[indexPath.row]
    }
}

extension CharactersListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        self.searchController?.updateSearch(text: searchController.searchBar.text)
    }
}

