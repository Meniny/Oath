//
//  Promise+Retry.swift
//  iPromise
//
//  Created by Elias Abel on 22/02/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

extension Promise {
    public func retry(_ nbOfTimes: UInt) -> Promise<T> {
        guard nbOfTimes > 0 else {
            return Promise.reject(PromiseError.retryInvalidInput)
        }
        let p = newLinkedPromise()
        self.numberOfRetries = nbOfTimes
        self.syncStateWithCallBacks(
            success: { [weak self] t in
                self?.numberOfRetries = 0
                p.fulfill(t)
            },
            failure: { [weak self] e in
                self?.numberOfRetries -= 1
                if self?.numberOfRetries == 0 {
                    p.reject(e)
                } else {
                    self?.resetState()
                    self?.start()
                }
            },
            progress: p.setProgress)
        return p
    }
}
