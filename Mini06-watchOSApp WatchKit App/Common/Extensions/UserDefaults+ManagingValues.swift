//
//  UserDefaults+ManagingValues.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 22/06/22.
//

import Foundation

extension UserDefaults {
    func bool(withKey key: UserDefaultsKeys) -> Bool {
        return bool(forKey: key.rawValue)
    }
    
    func setValue(_ value: Any?, withKey key: UserDefaultsKeys) {
        setValue(value, forKey: key.rawValue)
    }
}
