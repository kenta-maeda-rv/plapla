//
//  BoardingScreen.swift
//  VASvaluation
//
//  Created by まえけん on 2021/10/17.
//  Copyright © 2021 maeken. All rights reserved.
//

import SwiftUI

/// チュートリアル画面
struct BoardingScreen: Identifiable {
    /// 画面ID
    var id = UUID().uuidString
    /// 画像名
    var image: String
    /// タイトル
    var title: String
    /// 詳細文
    var description: String
}

/// チュートリアル画像配列
var boardingScreens: [BoardingScreen] = [

    BoardingScreen(image: "create",
                   title: "プラモ作成の記録",
                   description: "プラモデル作成の進捗を記録"),

    BoardingScreen(image: "timeline",
                   title: "タイムライン表示",
                   description: "記録はTL表示"),

    BoardingScreen(image: "social",
                   title: "すぐに共有で共有",
                   description: "SNSですぐに共有"),
]
