//
//  main.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/1/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

let accessToken = ProcessInfo.processInfo.environment["github_access_token"] ?? ""
let organization = ProcessInfo.processInfo.environment["github_organization"] ?? ""
let repository = ProcessInfo.processInfo.environment["github_repository"] ?? ""

// MARK: - Make Request

let getIssuesRequest: URLRequest = .getIssues(forRepo: repository, within: organization, authorization: accessToken)

//let createIssueRequest: URLRequest = .createIssue(testIssue, forRepo: repository, within: organization, authorization: accessToken)

let dataTask = URLSession.shared.dataTask(with: getIssuesRequest) { (data, response, error) in
    guard let data = data else {
        print(error!.localizedDescription)
        exit(EXIT_FAILURE)
    }
    let json = try? JSONSerialization.jsonObject(with: data, options: [])
    print(json!)
    exit(EXIT_SUCCESS)
}

dataTask.resume()
RunLoop.main.run()
