//
//  Issue.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/2/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

struct Issue: Codable {
    let title: String
    let body: String?
    let assignees: [String]?
    let milestone: Int?
    let labels: [String]?
}
