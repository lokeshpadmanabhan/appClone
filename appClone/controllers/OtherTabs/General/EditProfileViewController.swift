//
//  EditProfileViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 25/04/24.
//

import UIKit

struct EditProfileForModel{
    let label : String
    let placeholder : String
    var value : String?
}

final class EditProfileViewController: UIViewController , UITableViewDataSource {
   
    private let tabelview: UITableView = {
      let tabelview = UITableView()
        tabelview.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tabelview
    }()
    
    private var Models = [[EditProfileForModel]] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tabelview.tableHeaderView = createTabelHeaderView()
        tabelview.dataSource = self
        view.addSubview(tabelview )
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))
    }
    private func configureModels() {
        //name, username, website, bio
        let section1Label = ["Name", "UserName", "BIO"]
        var section1 = [EditProfileForModel]()
        for label in section1Label {
            let model = EditProfileForModel(label: label,
                                            placeholder: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        Models.append(section1)
        // email , phone , gender
        
        let section2Label = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileForModel]()
        for label in section2Label {
            let model = EditProfileForModel(label: label,
                                            placeholder: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        Models.append(section2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabelview.frame = view.bounds
    }
    
    //mark - tabelview
    
    func createTabelHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.width,
                                          height: view.height/4).integral)
        let size = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width-size)/2,
                                                        y: (header.height-size)/2,
                                                        width: size,
                                                        height: size))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.tintColor = .label
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        profilePhotoButton.addTarget(self,
                                     action: #selector(didTapProfilePhotoButton),
                                     for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"),
                                              for: .normal)
        return header
    }
    @objc private func didTapProfilePhotoButton() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = Models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self

        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return " private informstion "
    }
    
    
    
    //mark -Actions
    
    @objc private func didTapSave() {
        //save info to database
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapChangeProfilePicture() {
        
        let actionSheet = UIAlertController(title: "profile Picture",
                                            message: "Change Profile Picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {_ in 
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: {_ in 
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }

}
extension EditProfileViewController :FormTableViewCellDelegate {
    func formTabelViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileForModel) {
        //update model
        print(updatedModel.value ?? "nil")
    }
    
    
}
