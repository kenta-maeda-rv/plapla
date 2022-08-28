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
    @objc dynamic var contentId: String?
    // タイトル
    @objc dynamic var contentTitle: String?
    // 内容
    @objc dynamic var contentDiscription: String?
    // 画像
    @objc dynamic var contentImageUrl: String?
    // 最終編集日
    @objc dynamic var lastEditDate: Date?
    
    public convenience init(
        contentId: String?,
        contentTitle: String?,
        contentDiscription: String?,
        contentImageUrl: String?,
        lastEditDate: Date?
    ) {
        self.init()
        
        self.contentId = contentId
        self.contentTitle = contentTitle
        self.contentDiscription = contentDiscription
        self.contentImageUrl = contentImageUrl
        self.lastEditDate = lastEditDate
    }
}
