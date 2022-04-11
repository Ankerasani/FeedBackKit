//
//  FeedBackConfiguration.swift
//  FeedBackKit
//
//  Created by ankerasani on 4/10/22.
//

import Foundation

/// This class is used to provide basic configuration information necessary for accessing the
/// FeedBack Kit functionality.
@objcMembers public class FeedBackConfiguration: NSObject {
    
    /// Functionality Title of the current flow
    public var flowTitle: String
    
    /// The user transaction ID for the current flow
    public var transactionID: String
    
    ///
    /// - Parameters:
    ///     - transactionID: The user transaction ID for the current flow
    ///     - flowTitle: Functionality Title of the current flow
    
    public init(flowTitle: String, transactionID: String) {
        self.flowTitle = flowTitle
        self.transactionID = transactionID
    }
}
