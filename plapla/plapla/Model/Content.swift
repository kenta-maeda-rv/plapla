//
//  Content.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import Foundation
import SwiftUI

/// コンテンツ
struct Content: Identifiable {
    // 固有id
    var id = UUID().uuidString
    // タイトル
    var contentTitle: String
    // 内容
    var contentDrscription: String
    // 画像
    var contentImage: Image?
    // 最終編集日
    var lastEditDate: Date
    // 投稿
    var postData: [PostData]
    
}

/// 投稿
struct PostData: Identifiable {
    // 固有id
    var id: ObjectIdentifier
    // コンテンツId
    var contentId: String
    // 投稿タイトル
    var postTitle: String
    // 投稿内容
    var postDrscription: String
    // 投稿日
    var postDate: Date
    // 画像
    var Image: Image
    // 工程
    var process: [Process]
    
}

/// 工程
enum Process {
    /// 準備
    static let preparation = "準備"
    /// 仮組み
    static let temporaryAssembly = "仮組み"
    /// 本組
    static let assembly = "本組"
    /// 塗装
    static let painting = "塗装"
    /// デカール貼り
    static let decalPasting = "デカール貼り"
    /// 完成
    static let complete = "完成"
    
}
