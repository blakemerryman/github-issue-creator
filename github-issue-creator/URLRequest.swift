//
//  URLRequest.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/1/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

extension URLRequest {

    /// Builds a GraphQL request.
    init(gqlURL: URL, authToken: String, parameters: [String: Any]) throws {
        self.init(url: gqlURL)
        self.httpMethod = "POST"
        self.allHTTPHeaderFields = [
            "Authorization": "bearer \(authToken)",
            "Content-Type": "application/json"
        ]
        let bodyData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        httpBody = bodyData
    }

}
