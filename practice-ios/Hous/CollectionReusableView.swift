//
//  HeaderCollectionReusableView.swift
//  practice-ios
//
//  Created by 김민재 on 2022/07/03.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let titleLabel = UILabel().then {
        $0.text = "Hous-"
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
        $0.textAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func setHeaderData(text: String) {
        titleLabel.text = text
    }
}


class FooterCollectionReusableView: UICollectionReusableView {
        
}
