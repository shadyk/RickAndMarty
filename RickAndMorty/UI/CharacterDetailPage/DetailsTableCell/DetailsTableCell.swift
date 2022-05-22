//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DetailsTableCell: UITableViewCell {
    
    var viewModel: DetailViewModel? {
        didSet{
            lblTitle.text = viewModel?.title
            lblValue.text = viewModel?.value
        }
    }

    private var lblTitle: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .lightGray
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .left
        l.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return l
    }()

    private var lblValue: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.numberOfLines = 0
        l.textColor = .black
        l.textAlignment = .right
        l.lineBreakMode = .byWordWrapping
        l.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return l
    }()
    
    private lazy var sep = LineSeparator()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       setupInterface()
    }
    
    private func setupInterface(){

        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblValue)
        contentView.addSubview(sep)
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
            make.centerY.equalToSuperview()
            
        }
        lblValue.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(lblTitle.snp.trailing).offset(5)
            make.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12))
            make.centerY.equalToSuperview()
        }
        
        sep.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            make.height.equalTo(1)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
