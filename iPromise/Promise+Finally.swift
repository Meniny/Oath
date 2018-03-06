//
//  Promise+Finally.swift
//  iPromise
//
//  Created by Elias Abel on 20/02/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

public extension Promise {
    
    public func always(_ block: @escaping () -> Void) {
        finally(block)
    }
    
    public func registerAlways(_ block: @escaping () -> Void) {
        registerFinally(block)
    }
    
    public func finally(_ block: @escaping () -> Void) {
        tryStartInitialPromiseAndStartIfneeded()
        registerFinally(block)
    }
    
    public func registerFinally(_ block: @escaping () -> Void) {
        switch state {
        case .rejected, .fulfilled:
            block()
        case .dormant, .pending:
            blocks.finally.append(block)
        }
    }
}
