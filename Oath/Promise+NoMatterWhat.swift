//
//  Promise+NoMatterWhat.swift
//  Oath
//
//  Created by Elias Abel on 24/02/2017.
//  Copyright © 2017 Bushtit Lab. All rights reserved.
//

import Foundation

extension Promise {

    public func noMatterWhat(_ block: @escaping () -> Void) -> Promise<T> {
        let p = newLinkedPromise()
        syncStateWithCallBacks(
            success: { t in
                block()
                p.fulfill(t)
            },
            failure: { e in
                block()
                p.reject(e)
            },
            progress: p.setProgress)
        return p
    }
}
