//
//  Promise+Validate.swift
//  Oath
//
//  Created by Elias Abel on 22/02/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

extension Promise {
    
    @discardableResult
    public func validate(withError: Error = PromiseError.validationFailed,
                         _ assertionBlock:@escaping ((T) -> Bool)) -> Promise<T> {
        let p = newLinkedPromise()
        syncStateWithCallBacks(
            success: { t in
                if assertionBlock(t) {
                    p.fulfill(t)
                } else {
                    p.reject(withError)
                }
            },
            failure: p.reject,
            progress: p.setProgress)
        return p
    }
}
