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
        contentDrscription: String,
        contentImageUrl: String,
        lastEditDate: Date,
        postData: [PostData]?
        
    ) {
        let realm = try? realmPermanentlyDb()
        
        try? realm?.write {
            let db = Content(
                contentId: contentId,
                contentTitle: contentTitle,
                contentDrscription: contentDrscription,
                contentImageUrl: contentImageUrl,
                lastEditDate: lastEditDate
            )
            realm?.add(db)
        }
    }
}
