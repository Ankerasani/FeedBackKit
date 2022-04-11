//
//  FeedBackManager.swift
//  FeedBackKit
//
//  Created by ankerasani on 4/10/22.
//

import Foundation
import UIKit

/// Completion handler for `presentFeedBackViewController`
///
/// - Parameters:
///     - feedBackMessage: The message written by the user.
///
public typealias FeedBackCompletion = (( _ selection: FeedBackButtonSelection, _ feedBackMessage: String, _ transactionId: String) -> Void)

@objc public class FeedBackManager: NSObject {

    public private(set) var configuration: FeedBackConfiguration

    // -------------------------------------------------------------------------
    
    // MARK: - Initialization
    
    // -------------------------------------------------------------------------
    
    /// Initializes an FeedBackManager instance with the specified settings.
    ///
    /// - Parameters:
    ///     - configuration: Configuration for FeedBack functionality. See FeedBackConfiguration
    ///         object for more detail.

    @objc public init(configuration: FeedBackConfiguration) {
        self.configuration = configuration
    }

    public func presentFeedBackKit(from viewController: UIViewController, completion: @escaping FeedBackCompletion) {
       
        let title = configuration.flowTitle ?? "Do you like FeedBackKit?"
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        let itsGreatAction = UIAlertAction(title: "It's great", style: UIAlertAction.Style.default, handler: {
            (_)in
            completion(.itsGreat, "It's great", self.configuration.transactionID)
        })
        
        let needsImprovement = UIAlertAction(title: "Needs improvement", style: UIAlertAction.Style.default, handler: {
            (_)in
            self.presentFeedBackViewController(from: viewController, completion: completion)
        })
        
        let askMeLater = UIAlertAction(title: "Ask me later", style: UIAlertAction.Style.default, handler: {
            (_)in
            completion(.askMeLater, "Ask me later", self.configuration.transactionID)
        })
        alert.addAction(itsGreatAction)
        alert.addAction(needsImprovement)
        alert.addAction(askMeLater)
        viewController.present(alert, animated: false, completion: nil)
    }
    
    private func presentFeedBackViewController(from viewController: UIViewController, completion: @escaping FeedBackCompletion) {
        let frameworkBundle: Bundle = Bundle(for: FeedBackManager.self)
        let storyboard = UIStoryboard(name: "FeedBackKitMain", bundle: frameworkBundle)
        
        guard let feedBackViewController = storyboard.instantiateViewController(withIdentifier: "FeedBackViewController") as? FeedBackViewController else {
            return
        }
        feedBackViewController.configuration = configuration
        feedBackViewController.completion = completion
        viewController.present(feedBackViewController, animated: true, completion: nil)
    }
    
}
