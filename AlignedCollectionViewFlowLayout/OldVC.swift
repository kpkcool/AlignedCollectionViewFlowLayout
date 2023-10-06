//
//  OldVC.swift
//  AlignedCollectionViewFlowLayout
//
//  Created by K Praveen Kumar on 06/10/23.
//

import Foundation
/*
 class ViewController: UIViewController {
     
     private lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.text = "Review Images"
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     private lazy var collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collection.isScrollEnabled = false
         collection.showsVerticalScrollIndicator = false
         collection.showsHorizontalScrollIndicator = false
         collection.translatesAutoresizingMaskIntoConstraints = false
         collection.layer.cornerRadius = 12
         return collection
     }()
     
     var numberOfImages: Int = 1
     var proposedNumber: Int {
         return numberOfImages <= 4 ? 4 : 8
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .systemMint
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
             collectionView.heightAnchor.constraint(equalToConstant: calculateCollectionViewHeightAndWidth(widthPerItem: ViewController.widthPerItem()).height),
             collectionView.widthAnchor.constraint(equalToConstant: calculateCollectionViewHeightAndWidth(widthPerItem: ViewController.widthPerItem()).width)
             
         ])
         // collectionView.fillSuperview()
     }
 }

 extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         numberOfImages
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ReviewedImageCell.self), for: indexPath) as? ReviewedImageCell else { return UICollectionViewCell() }

         imageCell.configure(count: 0, imageUrl: "https://www.usaoncanvas.com/images/low_res_oilpainting.jpg")
         return imageCell
     }
     

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         // Calculate the cell size based on the collection view's width and the number of cells per row
 //        let collectionViewWidth = collectionView.bounds.width
 //        let cellsPerRow = 4 // Adjust this to the number of cells you want per row
 //        let cellWidth = collectionViewWidth / CGFloat(cellsPerRow)
         return CGSize(width: ViewController.widthPerItem(), height: ViewController.widthPerItem())
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         8
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         0
     }
     
     func calculateCollectionViewHeightAndWidth(widthPerItem: CGFloat) -> CGSize {
         
         if proposedNumber <= 4 {
             let height = widthPerItem
             let width = widthPerItem * CGFloat(numberOfImages) + CGFloat(numberOfImages - 1) * 8
             return CGSize(width: width, height: height)
         }
         else {
             let height = widthPerItem * 2 + 8
             let width = widthPerItem * CGFloat(numberOfImages)
             return CGSize(width: width, height: height)
         }
         
     }
     
     static func widthPerItem() -> CGFloat {
         let leftRightPadding: CGFloat = 32.0
         let spaceBetweenItems: CGFloat = 8.0
         let availableWidth: CGFloat = UIScreen.main.bounds.width - leftRightPadding - spaceBetweenItems
         return availableWidth / 4
     }
     
 }


 */
