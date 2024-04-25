//
//  ViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 24/04/24.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    static let  identifer = "HomeViewController"
    
    private let tableview: UITableView = {
       let tableview = UITableView()
        tableview.register(igFeedPostTableViewCell.self, forCellReuseIdentifier: igFeedPostTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handlenotauthenticated()

        
    }
    
    private func handlenotauthenticated () {
        //show auth status
        if Auth.auth().currentUser == nil {
            //show log in
            let LoginVc = LoginViewController()
            LoginVc.modalPresentationStyle = .fullScreen
            present(LoginVc , animated: false)
            
        }
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: igFeedPostTableViewCell.identifier, for: indexPath) as! igFeedPostTableViewCell
        return cell
    }
    
    
}
