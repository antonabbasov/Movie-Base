//
//  SearchViewController.swift
//  Movie Base
//
//  Created by Anton on 06.12.2021.
//

import UIKit

final class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    private func setupTextField() {
        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 00, width: 300, height: 40))
            sampleTextField.placeholder = "Search"
            sampleTextField.font = UIFont.systemFont(ofSize: 15)
            sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
            sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            sampleTextField.delegate = self
            sampleTextField.isEnabled = true
            Utilities.styleTextField(sampleTextField)
        
            self.view.addSubview(sampleTextField)
    }
}

extension SearchViewController: UITextFieldDelegate {

}
