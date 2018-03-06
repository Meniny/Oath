//
//  Promise+Aliases.swift
//  iPromise
//
//  Created by Elias Abel on 20/02/2017.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

public typealias EmptyPromise = Promise<Void>
public typealias Async<T> = Promise<T>
public typealias AsyncTask = Async<Void>
