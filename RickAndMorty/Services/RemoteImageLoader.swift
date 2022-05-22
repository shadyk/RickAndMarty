//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class RemoteImageLoader : CharacterImageLoader{
    func loadImage(imageView: UIImageView, imageURL: URL) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: imageURL,
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
