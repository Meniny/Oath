//
//  Promise+Timeout.swift
//  Oath
//
//  Created by Elias Abel on 10/08/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

extension Promise {
    
    public func timeout(_ time: TimeInterval) -> Promise<T> {
        let timer: Promise<T> = Promises.delay(time).then {
            return Promise<T>.reject(PromiseError.timeout)
        }
        return Promises.race(timer, self)
    }
}
