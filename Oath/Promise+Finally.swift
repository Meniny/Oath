//
//  Promise+Finally.swift
//  Oath
//
//  Created by Elias Abel on 20/02/2017.
//  Copyright © 2017 Bushtit Lab. All rights reserved.
//

import Foundation

public extension Promise {
    
    func always(_ block: @escaping () -> Void) {
        finally(block)
    }
    
    func registerAlways(_ block: @escaping () -> Void) {
        registerFinally(block)
    }
    
    func finally(_ block: @escaping () -> Void) {
        tryStartInitialPromiseAndStartIfneeded()
        registerFinally(block)
    }
    
    func registerFinally(_ block: @escaping () -> Void) {
        switch state {
        case .rejected, .fulfilled:
            block()
        case .dormant, .pending:
            blocks.finally.append(block)
        }
    }
}
