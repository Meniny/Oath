//
//  Promise+Progress.swift
//  Oath
//
//  Created by Elias Abel on 20/02/2017.
//  Copyright © 2017 Bushtit Lab. All rights reserved.
//

import Foundation

public extension Promise {
    
    @discardableResult
    func progress(_ block: @escaping (Float) -> Void) -> Promise<T> {
        tryStartInitialPromiseAndStartIfneeded()
        let p = newLinkedPromise()
        syncStateWithCallBacks(
            success: p.fulfill,
            failure: p.reject,
            progress: { f in
                block(f)
                p.setProgress(f)
            }
        )
        p.start()
        return p
    }
    
    internal func setProgress(_ value: Float) {
        updateState(PromiseState<T>.pending(progress: value))
    }
}
