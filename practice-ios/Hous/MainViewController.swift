//
//  MainViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/07/03.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Properties
    private let titleLabel = UILabel().then {
        $0.text = "Hous-"
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private let comingUpLabel = UILabel().then {
        $0.text = "Coming up-"
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textAlignment = .left
    }

    private var comingUpEventsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
        setCollectionView()
    }
    
    //MARK: Custom Methods
    private func setCollectionView() {
        
        comingUpEventsCollectionView.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: EventsCollectionViewCell.identifier)
        
        
        comingUpEventsCollectionView.delegate = self
        comingUpEventsCollectionView.dataSource = self
    }
    
    
    private func render() {
        view.addSubview(titleLabel)
        view.addSubview(comingUpLabel)
        view.addSubview(comingUpEventsCollectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
        }
        
        comingUpLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
        }
        
        comingUpEventsCollectionView.snp.makeConstraints {
            $0.top.equalTo(comingUpLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
    }
}

//MARK: Delegate & DataSource
extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventDataModel.sampleData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = comingUpEventsCollectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.identifier, for: indexPath) as? EventsCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row == 0 {
            cell.d_dayLabel.isHidden = true
            cell.addIcon.isHidden = false
            cell.backgroudImageView.image = nil
            return cell
        } else {
            cell.d_dayLabel.isHidden = false
            cell.addIcon.isHidden = true
            cell.backgroudImageView.image = UIImage(systemName: "clock")
        }
        
        
        cell.setEventCellData(EventDataModel.sampleData[indexPath.row - 1])
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
        
}
