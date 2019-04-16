//
//  PromiseBlocks.swift
//  Oath
//
//  Created by Elias Abel on 26/10/16.
//  Copyright © 2016 Bushtit Lab. All rights reserved.
//

import Foundation

struct PromiseBlocks<T> {
    
    typealias SuccessBlock = (T) -> Void
    typealias FailBlock = (Error) -> Void
    typealias ProgressBlock = (Float) -> Void
    typealias FinallyBlock = () -> Void
    
    var success = [SuccessBlock]()
    var fail = [FailBlock]()
    var progress = [ProgressBlock]()
    var finally = [FinallyBlock]()
}
