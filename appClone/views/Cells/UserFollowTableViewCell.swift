//
//  UserFollowTableViewCell.swift
//  appClone
//
//  Created by Lokesh Cheenu on 30/04/24.
//

import UIKit

protocol UserFollowTableViewCellDelegate : AnyObject {
    func didTapFollowUnfollowButton( model: String)
}

class UserFollowTableViewCell: UITableViewCell {

    static let identifier = "UserFollowTableViewCell"
    
    weak var delegate : UserFollowTableViewCellDelegate? 
    
    private let profileimageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    private let namelabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    private let usernamelabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    private let followButton: UIButton = {
        let button = UIButton()
       
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(namelabel)
        contentView.addSubview(usernamelabel)
        contentView.addSubview(profileimageview)
        contentView.addSubview(followButton)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model : String) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileimageview.image = nil
        namelabel.text = nil
        usernamelabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
