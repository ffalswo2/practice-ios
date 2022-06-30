//
//  PhotoCollectionViewCell.swift
//  practice-ios
//
//  Created by 김민재 on 2022/07/01.
//

import UIKit

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
    
    func setPhotoCellData() {
        
    }
    
    
    
}
