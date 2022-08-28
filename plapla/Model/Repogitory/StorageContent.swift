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
    // ドキュメントディレクトリの「パス」（String型）定義
    var filePath: String {
        return  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    ///  コンテンツの保存
    func saveContent(
        contentTitle: String,
        contentDiscription: String,
        contentImage: UIImage,
        lastEditDate: Date
    ) {
        let realm = try? realmPermanentlyDb()
        
        let contentId = UUID().uuidString
        
        let path = createLocalDataFile(id: contentId)
        
        do {
            try realm?.write {
                let db = Content(
                    contentId: contentId,
                    contentTitle: contentTitle,
                    contentDiscription: contentDiscription,
                    contentImageUrl: path.path,
                    lastEditDate: lastEditDate
                )
                realm?.add(db)
            }
            logger.debug("コンテンツの保存に成功")
        } catch {
            logger.error("コンテンツの保存に失敗")
        }
        //pngで保存する場合
        let pngImageData = contentImage.pngData()
        do {
            try pngImageData!.write(to: path)
            logger.debug("画像の保存に成功")
        } catch {
            logger.error("画像の保存に失敗")
        }
    }
}
