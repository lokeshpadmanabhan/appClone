//
//  SettingViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import SafariServices
import UIKit

struct settingCellModel{
    let title: String
    let handler: (()->Void)
}

final class SettingViewController: UIViewController {

    private let tableview: UITableView = {
        let tableview = UITableView(frame: .zero,
                                    style: .grouped)
        tableview.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    private var data = [[settingCellModel]] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    private func configureModels() {
        
        data.append ([
            settingCellModel(title: "Edit Profile"){ [weak self] in
                self?.didTapEditProfile()
            },
            settingCellModel(title: "Invite Friends"){ [weak self] in
                self?.didTapInviteFriends()
            },
            settingCellModel(title: "Save Original Posts"){ [weak self] in
                self?.didTapSaveOriginalPosts()
            }
        ])
        
        data.append ([
            settingCellModel(title: "Terms Of Service"){ [weak self] in
                self?.openURl(type: .terms)
            },
            settingCellModel(title: "Privacy policy"){ [weak self] in
                self?.openURl(type: .privacy)

            },
            settingCellModel(title: "Help / FeedBack"){ [weak self] in
                self?.openURl(type: .help)

            }
        ])
        
        data.append ([
            settingCellModel(title: "Log Out"){ [weak self] in
                self?.didTapLogout()
            }
        ])
        
    }
    enum SettingsURLType {
        case terms, privacy, help
    }
    
    private func openURl(type: SettingsURLType ) {
        
        let urlString : String
        switch type {
        case.terms: urlString = "https://help.instagram.com/581066165581870"
        case.privacy: urlString = "https://help.instagram.com/155833707900388"
        case.help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        let VC = SFSafariViewController(url: url)
        present(VC, animated: true)
    }
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
    private func didTapInviteFriends() {
        // show share sheet to invite friends
        
    }
    private func didTapSaveOriginalPosts() {
 
        
    }
    
    
    private func didTapLogout() {
        let actionsheet = UIAlertController(title: "Log out",
                                            message: "Are you Sure you want to log out ?",
                                            preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionsheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in 
            
            AuthManager.shared.logout(completion: { success in
                DispatchQueue.main.async{
                    
                    if success {
                        let LoginVc = LoginViewController()
                        LoginVc.modalPresentationStyle = .fullScreen
                        self.present(LoginVc , animated: true){
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else{
                        //error occured
                        fatalError("could not sign out user")
                    }
                }
            })
        }))
        actionsheet.popoverPresentationController?.sourceView = tableview
        actionsheet.popoverPresentationController?.sourceRect = tableview.bounds
        present(actionsheet,animated: true)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
