//
//  ListViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import UIKit

class ListViewController: UIViewController {

    private let data: [String]
    
    private let tabelview: UITableView = {
       let tabelview = UITableView()
        tabelview.register(UserFollowTableViewCell .self, forCellReuseIdentifier: UserFollowTableViewCell.identifier)
        return tabelview
    }()
    init(data:[String]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource = self
        view.addSubview(tabelview)
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabelview.frame = view.bounds
    }


}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier, for: indexPath) as! UserFollowTableViewCell
        cell.configure(with: " ")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.row]
    }
}
