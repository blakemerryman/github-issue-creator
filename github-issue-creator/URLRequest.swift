//
//  URLRequest.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/1/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

extension URLRequest {

    private static let githubAPI = "https://api.github.com"

    private init(issuesForRepo repository: String, organization: String, authorization: String) {
        let url = URL(string: "https://api.github.com/repos/\(organization)/\(repository)/issues")!
        self.init(url: url)
        allHTTPHeaderFields = [
            "Authorization": "token \(authorization)",
            "Content-Type": "application/json",
            "Accept": "application/vnd.github.v3+json"
        ]
    }

    static func getIssues(forRepo repository: String, within organization: String, authorization: String) -> URLRequest {
        var request = URLRequest(issuesForRepo: repository, organization: organization, authorization: authorization)
        request.httpMethod = "GET"
        return request
    }

    static func createIssue(_ issue: Issue, forRepo repository: String, within organization: String, authorization: String) -> URLRequest {
        var request = URLRequest(issuesForRepo: repository, organization: organization, authorization: authorization)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(issue)
        return request
    }

}
