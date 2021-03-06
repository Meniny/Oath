//
//  Promise+Aliases.swift
//  Oath
//
//  Created by Elias Abel on 20/02/2017.
//  Copyright © 2017 Bushtit Lab. All rights reserved.
//

import Foundation

public typealias EmptyPromise = Promise<Void>
public typealias VoidPromise = Promise<Void>
public typealias PromiseVoid = Promise<Void>

public typealias Async<T> = Promise<T>
public typealias AsyncTask = Async<Void>

public typealias Oath<T> = Promise<T>
public typealias OathTask = Promise<Void>
