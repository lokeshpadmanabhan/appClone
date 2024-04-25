//
//  PhotoCollectionViewCell.swift
//  appClone
//
//  Created by Lokesh Cheenu on 29/04/24.
//
import SDWebImage
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
       let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User taped on image"
        accessibilityHint = "Double tap to open post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model: UserPost) {
        let url = model.ThumbnailImage
        photoImageView.sd_setImage(with: url, completed: nil)
        
    }
    public func configure(debug imagename: String) {
        photoImageView.image = UIImage(named: imagename)
    }
}

