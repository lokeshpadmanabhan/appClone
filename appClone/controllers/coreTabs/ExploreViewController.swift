//
//  ExploreViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 24/04/24.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private let searchbar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.backgroundColor = .secondarySystemBackground
        return searchbar
    }()
    
    private var collectionview: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.titleView = searchbar
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview?.delegate = self
        collectionview?.dataSource = self
        guard let collectionview = collectionview else {
            return
        }
        view.addSubview(collectionview)
    }
    


}
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
