//
//  FormTableViewCell.swift
//  appClone
//
//  Created by Lokesh Cheenu on 28/04/24.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject{
    func formTabelViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileForModel)
}
class FormTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "FormTableViewCell"
    
    private var model : EditProfileForModel?
    
    public weak var delegate: FormTableViewCellDelegate?
    
    private let formlabel: UILabel = {
        let label = UILabel ()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formlabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model : EditProfileForModel){
        self.model = model
        formlabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        formlabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        formlabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.height)
        field.frame = CGRect(x: formlabel.right+5,
                             y: 0,
                             width: contentView.width-10-formlabel.width,
                             height: contentView.height)
    }
    
    //MARK - FIeld
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {
            return true
        }
        
        delegate?.formTabelViewCell(self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
}
