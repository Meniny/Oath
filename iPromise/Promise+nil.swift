//
//  Promise+nil.swift
//  iPromise
//
//  Created by Sacha DSO on 31/01/2018.
//  Copyright © 2018 Meniny Lab. All rights reserved.
//

import Foundation

extension Promise {
    public func convertErrorToNil() -> Promise<T?> {
        return Promise<T?> { resolve, _ in
            self.then { t in
                resolve(t)
            }.onError { _ in
                resolve(nil)
            }
        }
    }
}