//
//  Async.swift
//  Oath
//
//  Created by Elias Abel on 13/03/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation
import Dispatch

@discardableResult
public func async<T>(block:@escaping () throws -> T) -> Async<T> {
    let p = Promise<T> { resolve, reject in
        DispatchQueue(label: "cn.meniny.oath.async.queue", attributes: .concurrent).async {
            do {
                let t = try block()
                resolve(t)
            } catch {
                reject(error)
            }
        }
    }
    p.start()
    return p
}
