//
//  StorageContent.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/07/18.
//

import Foundation
import RealmSwift

extension RepogitoryManager {
    
    // DBContent
    var contentPermanentlyDb: Results<Content>? {
        return (try? realmPermanentlyDb())?.objects(Content.self)
    }
    
    ///  コンテンツの保存
    func saveContent(
        contentId: String,
        contentTitle: String,
        contentDiscription: String,
        contentImageUrl: String,
        lastEditDate: Date
    ) {
        let realm = try? realmPermanentlyDb()
        
        try? realm?.write {
            let db = Content(
                contentTitle: contentTitle,
                contentDiscription: contentDiscription,
                contentImageUrl: contentImageUrl,
                lastEditDate: lastEditDate
            )
            realm?.add(db)
        }
    }
}
