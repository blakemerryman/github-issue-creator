//
//  main.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/1/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

// MARK: - Request Info

let query = """
query($organization_name:String!) {
    organization(login: $organization_name) {
        login
    }
}
"""

let variables = """
{
    "organization_name": "NashvilleCocoaHeads"
}
"""

let accessToken = ProcessInfo.processInfo.environment["access_token"] ?? ""
let graphQLEndpointURL = URL(string: "https://api.github.com/graphql")!
let request = try! URLRequest(gqlURL: graphQLEndpointURL,
                              authToken: accessToken,
                              query: query,
                              variables: variables)

// MARK: - Make Request

let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
    guard let data = data else {
        print(error!.localizedDescription)
        return
    }
    let json = try? JSONSerialization.jsonObject(with: data, options: [])
    print(json!)
    exit(EXIT_SUCCESS)
}

dataTask.resume()
RunLoop.main.run()
