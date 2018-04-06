//
//  NetworkDataOperation.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/5/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

class NetworkDataOperation: AsynchronousOperation {

    private var dataTask: URLSessionDataTask?
    var data: Data?

    init(session: URLSession, request: URLRequest) {
        super.init()

        self.dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in

            defer {
                self?.completeOperation()
            }

            guard let data = data else {
                guard let error = error else {
                    print("No data or error!")
                    return
                }
                print(error.localizedDescription)
                return
            }

            self?.data = data
        }
    }

    override func main() {
        super.main()

        guard case .executing = state else {
            return
        }

        dataTask?.resume()
    }

    override func cancel() {
        dataTask?.cancel()
        super.cancel()
    }

}
