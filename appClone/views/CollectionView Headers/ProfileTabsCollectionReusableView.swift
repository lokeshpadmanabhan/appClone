//
//  ProfileTabsCollectionReusableView.swift
//  appClone
//
//  Created by Lokesh Cheenu on 29/04/24.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()

}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    
    static let  identifer = "ProfileTabsCollectionReusableView"
    
    public weak var delegate : ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants {
        static let padding: CGFloat = 8
    }
    
    private let gridbutton : UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
      //  button.backgroundColor = .secondarySystemBackground
        button.setBackgroundImage(UIImage(systemName: "rectangle.grid.2x2"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    private let taggedbutton : UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
       // button.backgroundColor = .secondarySystemBackground
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(gridbutton)
        addSubview(taggedbutton)
        gridbutton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
        taggedbutton.addTarget(self,
                               action: #selector(didTapTaggedButton),
                               for: .touchUpInside)
    }
    @objc private func didTapGridButton() {
        gridbutton.tintColor = .systemBlue
        taggedbutton.tintColor = .systemGray
        delegate?.didTapGridButtonTab()
    }
    @objc private func didTapTaggedButton() {
        gridbutton.tintColor = .systemGray
        taggedbutton.tintColor = .systemBlue
        delegate?.didTapTaggedButtonTab()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height - (Constants.padding*2)
        let gridButtonX = ((width/2)-size)/2
        gridbutton.frame = CGRect(x: gridButtonX,
                                  y: Constants.padding,
                                  width: size,
                                  height: size)
        taggedbutton.frame =  CGRect(x: gridButtonX + (width/2),
                                   y: Constants.padding,
                                   width: size,
                                   height: size)
    }
}
