//
//  ViewController.swift
//  Comments
//
//  Created by Chmola Lilia on 1/4/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var lowerBoundTextField: UITextField!
    @IBOutlet private weak var upperBoundTextField: UITextField!
    @IBOutlet private weak var doneButton: UIButton!
    private let networkService = NetworkService()
    
    //MARK: - Controller lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        doneButton.alpha = 0.4
        doneButton.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        upperBoundTextField.text = nil
        lowerBoundTextField.text = nil
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "FromMainToComments", let vc = segue.destination as? CommentsViewController, let comments = sender as? [Comment] else { return }
        
        vc.comments = comments
    }
    
    //MARK: - IBAction func
    @IBAction private func doneButtonTapped(_ sender: Any) {
        view.endEditing(true)
        
        guard let start = Int(lowerBoundTextField.text ?? ""),
            let end = Int(upperBoundTextField.text ?? ""),
            start < end else { return }
        
        networkService.getComments(start: start, end: end) {[weak self] (comments) in
            self?.performSegue(withIdentifier: "FromMainToComments", sender: comments)
        }
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        if lowerBoundTextField.text == "0" {
            lowerBoundTextField.text = "1"
        }
        doneButton.alpha = 0.4
        doneButton.isEnabled = false
        if !lowerBoundTextField.text!.isEmpty && !upperBoundTextField.text!.isEmpty {
            guard let start = Int(lowerBoundTextField.text ?? ""),
                let end = Int(upperBoundTextField.text ?? ""),
                start < end else { return }
            doneButton.alpha = 1
            doneButton.isEnabled = true
        }
    }
}

