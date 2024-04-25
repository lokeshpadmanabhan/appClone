//
//  ProfileInfoHeaderCollectionReusableView.swift
//  appClone
//
//  Created by Lokesh Cheenu on 29/04/24.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate : AnyObject{
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapfollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapfollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditprofileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifer = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate : ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .red
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    private let postButton : UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton : UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()
    
    private let followersButton : UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()
    
    private let editProfileButton : UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = " Lokesh Cheenu"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel : UILabel = {
        let label = UILabel()
        label.text = "This is the creators Account"
        label.textColor = .label
        label.numberOfLines = 0 // line wrap
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    private func addSubviews() {
        
        addSubview(profilePhotoImageView)
        addSubview(postButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        
    }
    
    private func addButtonActions() {
        followersButton.addTarget(self,
                                  action: #selector(didTapFollowersButton),
                                  for: .touchUpInside)
        followingButton.addTarget(self,
                                  action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        postButton.addTarget(self,
                                  action: #selector(didTapPostsButton),
                                  for: .touchUpInside)
        editProfileButton.addTarget(self,
                                  action: #selector(didTapEditProfileButton),
                                  for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        let buttonheight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        postButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonheight).integral

        followersButton.frame = CGRect(
            x: postButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonheight).integral
        
        followingButton.frame = CGRect(
            x: followersButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonheight).integral
        
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonheight,
            width: countButtonWidth*3,
            height: buttonheight).integral
        
        nameLabel.frame = CGRect(
            x: 5,
            y: 5 + profilePhotoImageView.bottom,
            width: width-10,
            height: 50 ).integral
        
        let BioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(
            x: 5,
            y: 5 + nameLabel.bottom,
            width: width-10,
            height: BioLabelSize.height ).integral
    }
 
    // MARK - Actions
    
    @objc private func didTapFollowersButton() {
        delegate?.profileHeaderDidTapfollowersButton(self)
    }
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapfollowingButton(self)
    }
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostButton(self)
    }
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditprofileButton(self)
    }
    
}
