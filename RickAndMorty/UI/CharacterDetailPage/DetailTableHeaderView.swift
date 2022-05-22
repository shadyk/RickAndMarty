//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DetailTableHeaderView : UIView {
 
    private var imageLoader: CharacterImageLoader?
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(imagePath: String?, imageLoader: CharacterImageLoader){
        self.init(frame: .zero)
        self.imageLoader = imageLoader
        if let img = imagePath {
            setupImage(img)
        }
    }
    
    private func setupImage(_ imagePath :String){
        translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(36)
                make.size.equalTo(240)
            }
            loadImage(imagePath)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func loadImage(_ imgPath: String){
        guard let url = URL(string: imgPath) else { return }
        imageLoader?.loadImage(imageView: imageView, imageURL: url)
    }
    
}
