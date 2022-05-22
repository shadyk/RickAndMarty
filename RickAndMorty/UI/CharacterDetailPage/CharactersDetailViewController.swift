//
//  Created by Shady
//  All rights reserved.
//

import UIKit


class CharactersDetailViewController: UIViewController{
    
    private var controller: CharacterDetailController?
    private var tableModel = [DetailsTableCelllController]() {
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
        
    convenience init(title: String, controller: CharacterDetailController){
        self.init()
        self.controller = controller
        self.title = title
        setupInterface()
    }
    
    private func setupInterface(){
        view.addSubview(tableView)
        tableView.register(DetailsTableCell.self, forCellReuseIdentifier: "DetailsTableCell")
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let v = DetailTableHeaderView(imagePath: controller?.character.image, imageLoader: controller?.imageLoader ?? RemoteImageLoader())
        tableView.tableHeaderView = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableModel = controller?.getDetails() ?? []
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.sizeTableHeaderToFit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersDetailViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellController = cellController(forRowAt: indexPath)
        return cellController.view(in: tableView)
    }
    
    private func cellController(forRowAt indexPath: IndexPath) -> DetailsTableCelllController {
        return tableModel[indexPath.row]
    }
}






