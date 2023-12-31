//
//  SecondApproachVC.swift
//  AlignedCollectionViewFlowLayout
//
//  Created by K Praveen Kumar on 06/10/23.
//

import UIKit

class SecondApproachVC: UIViewController {
    
    private let testImageUrl: String = "https://www.usaoncanvas.com/images/low_res_oilpainting.jpg"
    static let horizontalSpaceBetweenImages: CGFloat = 4.0
    static let verticalSpaceBetweenImages: CGFloat = 4.0
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Review Images • Approach 2"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = SecondApproachVC.verticalSpaceBetweenImages
        layout.minimumInteritemSpacing = SecondApproachVC.horizontalSpaceBetweenImages
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 12
        return collection
    }()
    
    var numberOfImages: Int = 3
    var proposedNumber: Int {
        return numberOfImages <= 7 ? 4 : 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerCell()
        setupUI()
    }
    
    private func registerCell() {
        collectionView.register(ReviewedImageCell.self, forCellWithReuseIdentifier: String(describing: ReviewedImageCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setupUI(){
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            collectionView.heightAnchor.constraint(equalToConstant: calculateCollectionViewHeightAndWidth(widthPerItem: SecondApproachVC.widthPerItem()).height),
            collectionView.widthAnchor.constraint(equalToConstant: calculateCollectionViewHeightAndWidth(widthPerItem: SecondApproachVC.widthPerItem()).width)
        ])
    }
    
    static func widthPerItem() -> CGFloat {
        let leftRightPadding: CGFloat = 32.0
        let spaceBetweenItems: CGFloat = horizontalSpaceBetweenImages * 3
        let availableWidth: CGFloat = UIScreen.main.bounds.width - leftRightPadding - spaceBetweenItems
        return availableWidth / 4
    }
}
//MARK: - CollectionView Methods
extension SecondApproachVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        proposedNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ReviewedImageCell.self), for: indexPath) as? ReviewedImageCell else { return UICollectionViewCell() }
        imageCell.configure(count: getCountForLastCell(index: indexPath.row), imageUrl: testImageUrl)
        return imageCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SecondApproachVC.widthPerItem(), height: SecondApproachVC.widthPerItem())
    }
    
}

//MARK: - Required Methods
extension SecondApproachVC {
    func calculateCollectionViewHeightAndWidth(widthPerItem: CGFloat) -> CGSize {
        if proposedNumber == 4 {
            let height = widthPerItem
            let width = widthPerItem * CGFloat(numberOfImages) + CGFloat(numberOfImages - 1) * 4
            return CGSize(width: width, height: height)
        }
        else {
            let height = (widthPerItem * 2) + 4
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: height)
        }
    }
    
    func getCountForLastCell(index: Int) -> Int {
        if proposedNumber == 4 {
            return index == 3 ? remainingCount() : 0
        }
        else {
            return index == 7 ? remainingCount() : 0
        }
    }
    
    func remainingCount() -> Int {
        let remaniningCount = numberOfImages - 4
        if remaniningCount < 4 {
            return remaniningCount
        } else if remaniningCount == 4 {
            return 0
        }
        else {
            return remaniningCount - 4
        }
    }
}
