//
//  AsynchronousOperation.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/5/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

class AsynchronousOperation: Operation {

    final override var isAsynchronous: Bool {
        return true
    }

    // MARK: - State Helpers

    enum State: String {
        case ready
        case executing
        case finished

        var keyPath: String {
            return "is" + self.rawValue.capitalized
        }
    }

    private let stateLock = NSLock()
    private var _state: State = .ready

    final var state: State {
        get {
            stateLock.lock()
            let state = _state
            stateLock.unlock()
            return state
        }
        set {
            willChangeValue(forKey: _state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
            stateLock.lock()
            let oldValue = _state
            _state = newValue
            stateLock.unlock()
            didChangeValue(forKey: _state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }

    final override var isExecuting: Bool {
        return state == .executing
    }

    final override var isFinished: Bool {
        return state == .finished
    }

    // MARK: - Method Overrides

    final override func start() {
        guard !isCancelled else {
            state = .finished
            return
        }
        state = .ready
        main()
    }

    override func main() {
        state = isCancelled ? .finished : .executing
        // Override to provide Asynchronous logic (eg: n/w calls) with callback
    }

    func completeOperation() {
        state = .finished
    }

}
