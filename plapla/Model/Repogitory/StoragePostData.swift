//
//  StoragePostData.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/07/18.
//

import Foundation
import RealmSwift

extension RepogitoryManager {
    
    // DBContent
    var postDataPermanentlyDb: Results<PostData>? {
        return (try? realmPermanentlyDb())?.objects(PostData.self)
    }
    
    ///  コンテンツの保存
    func savePostData(
        postId: String,
        contentId: String,
        postTitle: String,
        postDrscription: String,
        postDate: Date,
        ImageUrl: String,
        process: Process
    ) {
        let realm = try? realmPermanentlyDb()
        
        try? realm?.write {
            let db = PostData(postId: postId,
                              contentId: contentId,
                              postTitle: postTitle,
                              postDrscription: postDrscription,
                              postDate: postDate,
                              ImageUrl: ImageUrl,
                              process: process
            )
            realm?.add(db)
        }
    }
}
