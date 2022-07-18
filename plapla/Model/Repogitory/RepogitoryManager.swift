//
//  RepogitoryManager.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/07/18.
//

import Foundation
import RealmSwift

class RepogitoryManager {
    
    static let shared = RepogitoryManager()
    
    func realmPermanentlyDb() throws -> Realm {
        return try Realm()
    }
}
