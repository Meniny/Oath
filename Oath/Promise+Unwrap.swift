//
//  Promise+Unwrap.swift
//  Oath
//
//  Created by Elias Abel on 18/03/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

public func unwrap<T>(_ param: T?) -> Promise<T> {
    if let param = param {
        return Promise.resolve(param)
    } else {
        return Promise.reject(PromiseError.unwrappingFailed)
    }
}
