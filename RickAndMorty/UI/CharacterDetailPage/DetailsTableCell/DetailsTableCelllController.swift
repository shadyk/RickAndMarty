//
//  Created by Shady
//  All rights reserved.
//  

import UIKit
final class DetailsTableCelllController {
    
    private var cell: DetailsTableCell?
    var viewModel: DetailViewModel?
    
    init(viewModel: DetailViewModel? = nil) {
        self.viewModel = viewModel
    }

    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
//        cell?.lblTitle.text = viewModel?.title ?? Localizable.NOT_AVAILABLE
//        cell?.lblValue.text = viewModel?.value ?? Localizable.NOT_AVAILABLE
        cell?.viewModel = viewModel
        return cell!
    }

}
