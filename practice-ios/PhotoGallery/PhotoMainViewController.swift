//
//  PhotoMainViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/06/29.
//

import UIKit

import SnapKit

import Then


class PhotoMainViewController: UIViewController {

    lazy var tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .horizontal
        
        
        return cv
    }()
    
    
    lazy var photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .systemOrange
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setCollectionView()
        setUI()
    }
    
    func setCollectionView() {
        tagCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
    }
    
    func setNavigationBar() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = nil
        
        self.title = "검색 결과"
        
        let moreOptionsItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(moreBtnDidTapped))
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refreshBtnDidTapped))
        
        moreOptionsItem.tintColor = .black.withAlphaComponent(0.7)
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        
        self.navigationItem.rightBarButtonItem = moreOptionsItem
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    func setUI() {
        view.addSubview(tagCollectionView)
        tagCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        view.addSubview(photoCollectionView)
        photoCollectionView.snp.makeConstraints {
            $0.top.equalTo(tagCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension PhotoMainViewController {
    
    @objc func moreBtnDidTapped() {
    }
    
    @objc func refreshBtnDidTapped() {
        
    }
}


extension PhotoMainViewController: UICollectionViewDelegate {
    
}


extension PhotoMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagCollectionView {
            return TagDataModel.sampleData.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(TagDataModel.sampleData[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
        
    }
}


extension PhotoMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagCollectionView {
            let titleInset = 10 + 10
            
            let cellWidth = TagDataModel.sampleData[indexPath.row].tagName.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]).width + CGFloat(titleInset) + 40

            
            return CGSize(width: cellWidth, height: 32)
        }
        return CGSize(width: 0, height: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tagCollectionView {
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tagCollectionView {
            return 10
        }
        
        return 0
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}
