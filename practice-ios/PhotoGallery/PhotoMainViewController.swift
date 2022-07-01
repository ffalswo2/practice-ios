//
//  PhotoMainViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/06/29.
//

import UIKit

import SnapKit

import Then

import PhotosUI

class PhotoMainViewController: UIViewController {
    
    var fetchResults: PHFetchResult<PHAsset>?

    lazy var tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .horizontal
        
        return cv
    }()
    
    
    lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setCollectionView()
        setUI()
    }
    
    func setCollectionView() {
        tagCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    
    func setNavigationBar() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = nil
        
        self.title = "검색 결과"
        
        let moreOptionsItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(checkPermission))
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refreshBtnDidTapped))
        
        moreOptionsItem.tintColor = .black.withAlphaComponent(0.7)
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        
        self.navigationItem.rightBarButtonItem = moreOptionsItem
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    @objc private func checkPermission() {
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .authorized || PHPhotoLibrary.authorizationStatus(for: .readWrite) == .limited {
            Dispatch.DispatchQueue.main.async {
                self.showPhotoLibrary()
            }
            
        } else if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .denied {
            Dispatch.DispatchQueue.main.async {
                self.makeAlertsWhenPhotoAccessDenied()
            }
        } else if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .notDetermined {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                self.checkPermission()
            }
        }
    }
    
    
    private func makeAlertsWhenPhotoAccessDenied() {
        let alert = UIAlertController(title: "앨범 접근 권한을 활성화 해주세요", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
            
        }))
        
        self.present(alert, animated: true)
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

//MARK: Objective-C methods
extension PhotoMainViewController {
    
    @objc func showPhotoLibrary() {
        let library = PHPhotoLibrary.shared()
        var config = PHPickerConfiguration(photoLibrary: library)
        config.selectionLimit = 10
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = self
        
        present(picker, animated: true)
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
        
        return self.fetchResults?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(TagDataModel.sampleData[indexPath.row])
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        
        if let asset = fetchResults?[indexPath.row] {
            cell.setPhotos(asset: asset)
        }
        
        return cell
        
    }
}


extension PhotoMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagCollectionView {
            let titleInset = 10 + 10
            let cancelBtnWidth = 40
            
            let cellWidth = TagDataModel.sampleData[indexPath.row].tagName.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]).width + CGFloat(titleInset) + CGFloat(cancelBtnWidth)

            
            return CGSize(width: cellWidth, height: 32)
        }
        
        
        return CGSize(width: UIScreen.main.bounds.width / 3 - 2, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tagCollectionView {
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tagCollectionView {
            return 0
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == photoCollectionView {
            return 1
        }
        return 10
    }
}


extension PhotoMainViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        let photoIdentifiers = results.map { $0.assetIdentifier ?? "" }
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: photoIdentifiers, options: nil)
        
        photoCollectionView.reloadData()
        
        self.dismiss(animated: true)
    }
}
