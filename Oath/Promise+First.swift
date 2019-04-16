//
//  Promise+First.swift
//  Oath
//
//  Created by Sacha DSO on 31/01/2018.
//  Copyright © 2018 Bushtit Lab. All rights reserved.
//

import Foundation

extension Promise {
    public func first<E>() -> Promise<E> where T == [E] {
        return self.then { unwrap($0.first) }
    }
}

extension Promise {
    public func last<E>() -> Promise<E> where T == [E] {
        return self.then { unwrap($0.last) }
    }
}
