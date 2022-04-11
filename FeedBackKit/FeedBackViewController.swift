//
//  MainViewController.swift
//  FeedBackKit
//
//  Created by ankerasani on 4/10/22.
//

import UIKit

class FeedBackViewController: UIViewController {
    
    var completion: FeedBackCompletion?
    var configuration: FeedBackConfiguration?
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        self.textView.layer.borderWidth = 1.0
        self.textView.layer.cornerRadius = 8
    }
    
    @IBAction func didSelectSubmitButton(_ sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true) {
            self.completion?(.needsImprovement, self.textView.text, self.configuration?.transactionID ?? "")
        }
    }
}
