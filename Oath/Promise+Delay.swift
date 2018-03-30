//
//  Promise+Delay.swift
//  Oath
//
//  Created by Elias Abel on 09/08/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation
import Dispatch

extension Promise {
    
    public func delay(_ time: TimeInterval) -> Promise<T> {
        let p = newLinkedPromise()
        syncStateWithCallBacks(
            success: { t in
                Promises.callBackOnCallingQueueIn(time: time) {
                    p.fulfill(t)
                }
            },
            failure: p.reject,
            progress: p.setProgress)
        return p
    }
}

extension Promises {
    public static func delay(_ time: TimeInterval) -> Promise<Void> {
        return Promise(void: { (resolve, _) in
            callBackOnCallingQueueIn(time: time, block: resolve)
        })
    }
}

extension Promises {

    static func callBackOnCallingQueueIn(time: TimeInterval, block: @escaping () -> Void) {
        if let callingQueue = OperationQueue.current?.underlyingQueue {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).asyncAfter(deadline: .now() + time) {
                callingQueue.async {
                    block()
                }
            }
        } else {
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + time) {
                block()
            }
        }
    }
}
