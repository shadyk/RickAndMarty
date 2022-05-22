//
//  Created by Shady
//  All rights reserved.
//

import UIKit

class ResultListViewController: UIViewController{
    
    private var controller: ResultListController?
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
        
    convenience init(controller: ResultListController){
        self.init()
        self.controller = controller
        setupInterface()
    }
    
    private func setupInterface(){
        view.addSubview(tableView)
        tableView.register(CharacterListTableCell.self, forCellReuseIdentifier: "CharacterListTableCell")
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    ///Used for search result
    func updateInterface(model: [CharacterListCellController] ){
        self.tableModel = model
    }
    
    func errorWhileSearching(message: String){
        self.showAlert(message: message)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ResultListViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.didSelect(nav: self.parent!.presentingViewController!.navigationController!, character: cellController(forRowAt: indexPath).viewModel!)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellController = cellController(forRowAt: indexPath)
        return cellController.view(in: tableView)
    }
    
    private func cellController(forRowAt indexPath: IndexPath) -> CharacterListCellController {
        return tableModel[indexPath.row]
    }
}
