//
//  Created by Shady
//  All rights reserved.
//  

import UIKit
final class CharacterListCellController {
    
    private var cell: CharacterListTableCell?
    var viewModel: CharacterViewModel?
    
    init(viewModel: CharacterViewModel? = nil) {
        self.viewModel = viewModel
    }

    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.lblEpisodes.text = "\(Localizable.NUMBER_OF_EPISODES) \(viewModel!.numberOfEpisodes)"
        cell?.lblName.text = "\(Localizable.NAME_LIST) \(viewModel!.name)"
        cell?.loadImage(imageLoader: RemoteImageLoader(), imgPath: viewModel?.image ?? "")
        return cell!
    }

}
