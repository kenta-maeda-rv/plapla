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
        contentId: String,
        postDiscription: String,
        postDate: Date,
        postImage: UIImage,
        process: Process
    ) {
        let realm = try? realmPermanentlyDb()
        
        let postId = UUID().uuidString
        
        let path = createLocalDataFile(id: postId)
        do {
            try realm?.write {
                let db = PostData(postId: postId,
                                  contentId: contentId,
                                  postDiscription: postDiscription,
                                  postDate: postDate,
                                  ImageUrl: path.path,
                                  process: process.processString
                )
                realm?.add(db)
                logger.debug("投稿の保存に成功")
            }
        } catch {
            logger.error("投稿の保存に失敗")
        }
        //pngで保存する場合
        let pngImageData = postImage.pngData()
        do {
            try pngImageData!.write(to: path)
            logger.debug("画像の保存に成功")
        } catch {
            logger.error("画像の保存に失敗")
        }
    }
    
    func getPostData(contentId: String) -> [PostData] {
        var result:[PostData] = []
        print("検索するcontentId:\(contentId)")
        guard let postData = RepogitoryManager.shared.postDataPermanentlyDb?.filter("contentId == %@", contentId) else {
            print("投稿データの取得失敗")
            return result
        }
        
        let data = postData.map{PostData(postId: $0.postId,
                                         contentId: $0.contentId!,
                                         postDiscription: $0.postDiscription!,
                                         postDate: $0.postDate!,
                                         ImageUrl: $0.ImageUrl!,
                                         process: $0.process!)}
        result.append(contentsOf: data)
        print("取得したコンテンツデータ\(result)")
        return result
    }
}
