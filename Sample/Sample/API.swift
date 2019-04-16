//
//  API.swift
//  Sample
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 2018/3/6.
//  Copyright © 2018年 Bushtit Lab. All rights reserved.
//

import Foundation
import Oath

fileprivate let Server: [String: JSON] = [
    "user": ["name": "Elias", "gender": "male"]
]

enum FetchError: Error {
    case dataError
    case rejected
}

class APIClient {
    @discardableResult
    class func fetchUserInfo() -> Promise<User> {
        
        return Promise { resolve, reject in
            
            output("Fetching user info ...")
            
            APIClient.fetch("user").then { jsonObj in
                guard let user = User.decode(from: jsonObj) else {
                    reject(FetchError.dataError)
                    return
                }
                resolve(user)
                }.onError({ (error) in
                    reject(error)
                })
        }
    }
    
    @discardableResult
    class func fetch(_ path: String) -> Promise<JSON> {
        return Promise { (resolve, reject) in
            // fake request
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                guard Int(arc4random_uniform(100)) % 2 == 0 else {
                    reject(FetchError.rejected)
                    return
                }
                guard let jsonObj = Server[path] else {
                    reject(FetchError.rejected)
                    return
                }
                resolve(jsonObj)
            })
        }
    }
}

