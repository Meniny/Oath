//
//  Promise+Error.swift
//  Oath
//
//  Created by Elias Abel on 20/02/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

public extension Promise {
    
    @discardableResult public func onError(_ block: @escaping (Error) -> Void) -> Promise<Void> {
        tryStartInitialPromiseAndStartIfneeded()
        return registerOnError(block)
    }
    
    @discardableResult public func registerOnError(_ block: @escaping (Error) -> Void) -> Promise<Void> {
        let p = Promise<Void>()
        passAlongFirstPromiseStartFunctionAndStateTo(p)
        syncStateWithCallBacks(
            success: { _ in
                p.fulfill(())
            },
            failure: { e in
                block(e)
                p.fulfill(())
            },
            progress: p.setProgress
        )
        p.start()
        return p
    }
}
