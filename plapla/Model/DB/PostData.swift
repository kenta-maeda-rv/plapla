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
    // 投稿内容
    @objc dynamic var postDiscription: String?
    // 投稿日
    @objc dynamic var postDate: Date?
    // 画像
    @objc dynamic var ImageUrl: String?
    // 工程
    @objc dynamic var process: String?
    
    public convenience init(
        postId: String,
        contentId: String,
        postDiscription: String,
        postDate: Date,
        ImageUrl: String,
        process: String
    ) {
        self.init()
        
        self.postId = postId
        self.contentId = contentId
        self.postDiscription = postDiscription
        self.postDate = postDate
        self.ImageUrl = ImageUrl
        self.process = process
    }
}

/// 工程
enum Process: String, Hashable, CaseIterable {
    /// 準備
    case preparation = "準備"
    /// 仮組み
    case temporaryAssembly = "仮組み"
    /// 本組
    case assembly = "本組"
    /// 塗装
    case painting = "塗装"
    /// デカール貼り
    case decalPasting = "デカール貼り"
    /// 完成
    case complete = "完成"
    
}

