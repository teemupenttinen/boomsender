//
//  BottomPicker.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 23.2.2021.
//

import UIKit

class BottomPicker: UIView {
    
    var options: [String] = []
    var pickerValue: Int = 0
    var textField = UITextField()
    var picker = UIPickerView()
    init(label: String, options: [String]) {
        super.init(frame: .zero)
        
        self.options = options
        
        let textLabel = UILabel()
        textLabel.text = label
        textLabel.textColor = .white
        
        textField = TextFieldNoCaret()
        
        let stackView = UIStackView()
        
        stackView.addSubview(textLabel)
        stackView.addSubview(textField)
        addSubview(stackView)

        textLabel.font = textLabel.font.withSize(22)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(15)
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.5)
        }
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.height.equalToSuperview().dividedBy(1.5)
            make.width.equalToSuperview()
        }
        
        picker = UIPickerView()
        picker.backgroundColor = .white

        picker.delegate = self
        picker.dataSource = self

        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        doneButton.tintColor = .systemBlue
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePicker))
        cancelButton.tintColor = .systemBlue
        
        toolBar.setItems([cancelButton, spacer, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        textField.inputView = picker
        textField.inputAccessoryView = toolBar

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func donePicker(_ sender: UIButton) {
        textField.endEditing(false)
        textField.text = options[pickerValue]
    }
    
}

extension BottomPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
}


extension BottomPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerValue = row
    }
}
