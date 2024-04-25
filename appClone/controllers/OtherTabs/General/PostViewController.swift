//
//  PostViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import UIKit

class PostViewController: UIViewController {

    private let model : UserPost?
    
    private let tabelview: UITableView = {
       let tabelview = UITableView()
        return tabelview
    }()
    
    init(model: UserPost?) {
        self.model = model
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabelview)
        tabelview.dataSource = self
        tabelview.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabelview.frame = view.bounds
    }
 
}
extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
