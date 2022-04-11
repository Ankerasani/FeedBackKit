//
//  ViewController.swift
//  FeedBackKitTestApp
//
//  Created by siva on 4/10/22.
//

import UIKit
import FeedBackKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentFeedBackKit()
    }

    private func presentFeedBackKit() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let transactionId = UUID().uuidString
            let configuration = FeedBackConfiguration(flowTitle: "Do you like FeedBackKit?", transactionID: transactionId)
            let feedBackManager = FeedBackManager(configuration: configuration)
            feedBackManager.presentFeedBackKit(from: self) { selection, feedBackMessage, transactionId in
                print(feedBackMessage)
            }
        }
    }
}

