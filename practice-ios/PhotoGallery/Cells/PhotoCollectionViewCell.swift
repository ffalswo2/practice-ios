//
//  PhotoCollectionViewCell.swift
//  practice-ios
//
//  Created by 김민재 on 2022/07/01.
//

import UIKit

import Photos

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemCyan
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setPhotoCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setPhotoCellUI() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
//    func setPhotoCellData(_ asset) {
//        photoImageView.image = asset
//    }
    
    func setPhotos(asset: PHAsset) {
        let photoManager = PHImageManager()

        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 125 * scale, height: 125 * scale)
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat

        photoManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { photo, info in
            self.photoImageView.image = photo
        }
    }
    
    
    
}
