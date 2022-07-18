//
//  PostData.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/07/18.
//

import Foundation
import RealmSwift

/// 投稿
class PostData: Object {
    // 投稿id
    @objc dynamic var postId = UUID().uuidString
    // コンテンツId
    @objc dynamic var contentId: String?
    // 投稿タイトル
    @objc dynamic var postTitle: String?
    // 投稿内容
    @objc dynamic var postDrscription: String?
    // 投稿日
    @objc dynamic var postDate: Date?
    // 画像
    @objc dynamic var ImageUrl: String?
    // 工程
    @objc dynamic var process: String?
    
    init(
        postId: String,
        contentId: String,
        postTitle: String,
        postDrscription: String,
        postDate: Date,
        ImageUrl: String,
        process: Process
    ) {
        self.postId = postId
        self.contentId = contentId
        self.postTitle = postTitle
        self.postDrscription = postDrscription
        self.postDate = postDate
        self.ImageUrl = ImageUrl
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

