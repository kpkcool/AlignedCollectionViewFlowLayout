//
//  ReviewedImageCell.swift
//  AlignedCollectionViewFlowLayout
//
//  Created by K Praveen Kumar on 06/10/23.
//

import UIKit

class ReviewedImageCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var reviewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var coverContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        return view
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .clear
        addSubview(containerView)

        containerView.addSubview(reviewImage)
        reviewImage.addSubview(coverContainerView)
        coverContainerView.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            reviewImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            reviewImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            reviewImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            reviewImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            coverContainerView.leadingAnchor.constraint(equalTo: reviewImage.leadingAnchor),
            coverContainerView.trailingAnchor.constraint(equalTo: reviewImage.trailingAnchor),
            coverContainerView.topAnchor.constraint(equalTo: reviewImage.topAnchor),
            coverContainerView.bottomAnchor.constraint(equalTo: reviewImage.bottomAnchor),
            
            numberLabel.centerXAnchor.constraint(equalTo: reviewImage.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: reviewImage.centerYAnchor)
            
        ])
    }
    
    func configure(count: Int, imageUrl: String){
        numberLabel.text = "+\(count)"
        if let imageURL = URL(string: imageUrl) {
            ImageLoader.loadImage(from: imageURL, into: reviewImage)
        }
        coverContainerView.isHidden = count == 0 ? true : false
    }
    
}
