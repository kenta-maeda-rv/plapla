//
//  Content.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import Foundation
import SwiftUI
import RealmSwift

/// コンテンツ
class Content: Object {
    // 固有id
    @objc dynamic var id = UUID().uuidString
    // タイトル
    @objc dynamic var contentTitle: String
    // 内容
    @objc dynamic var contentDrscription: String
    // 画像
    @objc dynamic var contentImage: UIImage?
    // 最終編集日
    @objc dynamic var lastEditDate: Date
    // 投稿
    @objc dynamic var postData: [PostData]
    
    init(
        id: String,
        contentTitle: String,
        contentDrscription: String,
        contentImage: UIImage?,
        lastEditDate: Date,
        postData: [PostData]
    ) {
        self.id = id
        self.contentTitle = contentTitle
        self.contentDrscription = contentDrscription
        self.contentImage = contentImage
        self.lastEditDate = lastEditDate
        self.postData = postData
    }
    
    /// ユーザー共通の永続化DB（ログアウトで削除されない）の場合、こちらを使用
    fileprivate func realmForContentPermanentlyDb() throws -> Realm {
        return try Realm()
    }
    
    var contentPermanentlyDb: Results<Content>? {
        return (try? realmForContentPermanentlyDb())?.objects(Content.self)
    }
    
    ///  コンテンツの保存
    func saveContent(
        id: String,
        contentTitle: String,
        contentDrscription: String,
        contentImage: UIImage?,
        lastEditDate: Date,
        postData: [PostData]
        
    ) {
        let realm = try? realmForContentPermanentlyDb()
        
        try? realm?.write {
            let db = Content(
                id: id,
                contentTitle: contentTitle,
                contentDrscription: contentDrscription,
                contentImage: contentImage,
                lastEditDate: lastEditDate,
                postData: postData
            )
            realm?.add(db)
        }
    }
}
/// 投稿
class PostData: Object {
    // 固有id
    @objc dynamic var id = UUID().uuidString
    // コンテンツId
    @objc dynamic var contentId: String
    // 投稿タイトル
    @objc dynamic var postTitle: String
    // 投稿内容
    @objc dynamic var postDrscription: String
    // 投稿日
    @objc dynamic var postDate: Date
    // 画像
    @objc dynamic var Image: UIImage
    // 工程
    @objc dynamic var process: String
    
    init(
        id: String,
        contentId: String,
        postTitle: String,
        postDrscription: String,
        postDate: Date,
        Image: UIImage,
        process: Process
    ) {
        self.id = id
        self.contentId = contentId
        self.postTitle = postTitle
        self.postDrscription = postDrscription
        self.postDate = postDate
        self.Image = Image
        self.process = process.processString
    }
}

/// 工程
enum Process {
    /// 準備
    case preparation
    /// 仮組み
    case temporaryAssembly
    /// 本組
    case assembly
    /// 塗装
    case painting
    /// デカール貼り
    case decalPasting
    /// 完成
    case complete
    
    var processString: String {
        switch self {
            case .preparation:
                return "準備"
            case .temporaryAssembly:
                return "仮組み"
            case .assembly:
                return "本組"
            case .painting:
                return "塗装"
            case .decalPasting:
                return "デカール貼り"
            case .complete:
                return "完成"
        }
    }
}

