//
//  TagCollectionViewCell.swift
//  practice-ios
//
//  Created by 김민재 on 2022/06/29.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TagCollectionViewCell"
    
    private lazy var tagButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemBlue
        config.image = UIImage(systemName: "x.circle.fill")
        config.imagePadding = 5
        config.imagePlacement = .trailing
        config.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: 10, bottom: .zero, trailing: .zero)
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setCellUI() {
        addSubview(tagButton)
        tagButton.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setData(_ data: TagDataModel) {
        tagButton.setTitle(data.tagName, for: .normal)
    }
    
    
}
