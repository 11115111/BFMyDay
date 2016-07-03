//
//  PreferenceUtil.swift
//  BFStory
//
//  Created by panbc on 16/6/16.
//  Copyright © 2016年 panbc. All rights reserved.
//

import Foundation

class PreferenceUtil {
    
    enum Keys : String {
        case LOGIN_SESSION_ID = "loginsession"
        case EVENT_ID = "eventid"
        case PREVIOUS_CONTENT_CACHE = "previouscontentcache"
    }
    
    static var sessionValid : Bool {
        if let session =  sessionID {
            return !session.isEmpty
        } else {
            return false
        }
    }
    
    static var sessionID : String? {
        get {
            return  NSUserDefaults.standardUserDefaults().stringForKey(Keys.LOGIN_SESSION_ID.rawValue)
        }
        set(newSessionID) {
             NSUserDefaults.standardUserDefaults().setObject(newSessionID, forKey: Keys.LOGIN_SESSION_ID.rawValue)
        }
    }
    
    static var eventID : String? {
        get {
            return  NSUserDefaults.standardUserDefaults().stringForKey(Keys.EVENT_ID.rawValue)
        }
        set(newEventID) {
            NSUserDefaults.standardUserDefaults().setObject(newEventID, forKey: Keys.EVENT_ID.rawValue)
        }
    }
    
    static var previousContent : String? {
        get {
            return  NSUserDefaults.standardUserDefaults().stringForKey(Keys.PREVIOUS_CONTENT_CACHE.rawValue)
        }
        set(newContent) {
            NSUserDefaults.standardUserDefaults().setObject(newContent, forKey: Keys.PREVIOUS_CONTENT_CACHE.rawValue)
        }
    }
}