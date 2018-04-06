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

print("Started at \(Date()).")

let operations = Issue.defaultIssues.map { issue -> Operation in
    let request: URLRequest = .createIssue(issue, forRepo: repository, within: organization, authorization: accessToken)
    let operation = NetworkDataOperation(session: .shared, request: request)
    operation.completionBlock = {
        print("Operation completed at \(Date())")
    }
    return operation
}

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 1 // serial queue
queue.addOperations(operations, waitUntilFinished: true)
print("Finished at \(Date()).")
