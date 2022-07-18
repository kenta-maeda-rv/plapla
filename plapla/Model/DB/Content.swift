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
    // コンテンツId
    @objc dynamic var contentId = UUID().uuidString
    // タイトル
    @objc dynamic var contentTitle: String?
    // 内容
    @objc dynamic var contentDrscription: String?
    // 画像
    @objc dynamic var contentImageUrl: String?
    // 最終編集日
    @objc dynamic var lastEditDate: Date?
    
    init(
        contentId: String,
        contentTitle: String,
        contentDrscription: String,
        contentImageUrl: String?,
        lastEditDate: Date
    ) {
        self.contentId = contentId
        self.contentTitle = contentTitle
        self.contentDrscription = contentDrscription
        self.contentImageUrl = contentImageUrl
        self.lastEditDate = lastEditDate
    }
}
