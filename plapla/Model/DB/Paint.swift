//
//  Paint.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/15.
//

import Foundation
import SwiftUI
import RealmSwift

/// 塗料
class Paint: Object, Identifiable {
    // 固有id
    @objc dynamic var id = UUID().uuidString
    /// 塗料カラー名
    @objc dynamic var colorName: String?
    /// ブランド
    @objc dynamic var brand: String?
    /// タイプ
    @objc dynamic var type: String?
    /// 溶剤
    @objc dynamic var solvent: String?
    /// 仕上がり
    @objc dynamic var finish: String?
    /// 残量
    @objc dynamic var quantity: Double = 0.0
    
    public convenience init(
        id: String,
        color: PaintColor,
        brand: PaintBrand,
        type: PaintType,
        solvent: Solvent,
        finish: Finish,
        quantity: Double
    ) {
        self.init()
        
        self.id = id
        self.colorName = color.rawValue
        self.brand = brand.rawValue
        self.type = type.rawValue
        self.solvent = solvent.rawValue
        self.finish = finish.rawValue
        self.quantity = quantity
    }
}

/// 塗料カラー
enum PaintColor: String, Hashable, CaseIterable {
    /// レッド
    case red = "レッド"
    /// オレンジ
    case orange = "オレンジ"
    /// イエロー
    case yellow = "イエロー"
    /// グリーン
    case green = "グリーン"
    /// スカイ
    case sky = "スカイ"
    /// ブルー
    case blue = "ブルー"
    /// パープル
    case purple = "パープル"
    /// ピンク
    case pink = "ピンク"
    /// ブラウン
    case brown = "ブラウン"
    /// フレッシュ
    case fresh = "フレッシュ"
    /// タン
    case tan = "タン"
    /// カーキ
    case khaki = "カーキ"
    /// ダークグリーン
    case darkGreen = "ダークグリーン"
    /// オリーブグリーン
    case oliveGreen = "オリーブグリーン"
    /// グリーングレー
    case greenGray = "グリーングレー"
    /// ブルーグレー
    case blueGray = "ブルーグレー"
    /// ゴールド
    case gold = "ゴールド"
    /// シルバー
    case silver = "シルバー"
    /// カッパー
    case copper = "カッパー"
    /// クリア
    case clear = "クリア"
    /// ブラック
    case black = "ブラック"
    /// グレー
    case gray = "グレー"
    /// ホワイト
    case white = "ホワイト"
}

let PaintUIColorDic:[String: UIColor] = [
    PaintColor.red.rawValue: UIColor(red: 254/255, green: 39/255, blue: 18/255, alpha: 1),
    PaintColor.orange.rawValue: UIColor(red: 251/255, green: 153/255, blue: 2/255, alpha: 1),
    PaintColor.yellow.rawValue: UIColor(red: 254/255, green: 254/255, blue: 51/255, alpha: 1),
    PaintColor.green.rawValue: UIColor(red: 102/255, green: 176/255, blue: 50/255, alpha: 1),
    PaintColor.sky.rawValue: UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1),
    PaintColor.blue.rawValue: UIColor(red: 36/255, green: 84/255, blue: 165/255, alpha: 1),
    PaintColor.purple.rawValue: UIColor(red: 134/255, green: 1/255, blue: 175/255, alpha: 1),
    PaintColor.pink.rawValue: UIColor(red: 228/255, green: 0/255, blue: 127/255, alpha: 1),
    PaintColor.brown.rawValue: UIColor(red: 123/255, green: 55/255, blue: 30/255, alpha: 1),
    PaintColor.fresh.rawValue: UIColor(red: 246/255, green: 234/255, blue: 222/255, alpha: 1),
    PaintColor.tan.rawValue: UIColor(red: 163/255, green: 137/255, blue: 134/255, alpha: 1),
    PaintColor.khaki.rawValue: UIColor(red: 187/255, green: 160/255, blue: 74/255, alpha: 1),
    PaintColor.darkGreen.rawValue: UIColor(red: 48/255, green: 67/255, blue: 46/255, alpha: 1),
    PaintColor.oliveGreen.rawValue: UIColor(red: 127/255, green: 142/255, blue: 105/255, alpha: 1),
    PaintColor.greenGray.rawValue: UIColor(red: 155/255, green: 171/255, blue: 169/255, alpha: 1),
    PaintColor.blueGray.rawValue: UIColor(red: 83/255, green: 155/255, blue: 153/255, alpha: 1),
    PaintColor.gold.rawValue: UIColor(red: 230/255, green: 180/255, blue: 34/255, alpha: 1),
    PaintColor.silver.rawValue: UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1),
    PaintColor.copper.rawValue: UIColor(red: 184/255, green: 115/255, blue: 51/255, alpha: 1),
    PaintColor.clear.rawValue: UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1),
    PaintColor.black.rawValue: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1),
    PaintColor.gray.rawValue: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1),
    PaintColor.white.rawValue: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
]

/// ブランド
enum PaintBrand: String, Hashable, CaseIterable {
    /// タミヤアクリルミニ
    case tamiyaAcrylicMini = "タミヤアクリルミニ"
    /// タミヤラッカー
    case tamiyalacquer = "タミヤラッカー"
    /// タミヤエナメル
    case tamiyaEnamel = "タミヤエナメル"
    /// Mr.カラー
    case mrColor = "Mr.カラー"
    /// ガンダムカラー
    case gundamColor = "ガンダムカラー"
    /// ガンダムマーカー
    case gundamMarker = "ガンダムマーカー"
    /// 水性ホビーカラー
    case aqueousHobbyColor = "水性ホビーカラー"
    /// アクリジョン
    case acrysion = "アクリジョン"
    /// ガイアカラー
    case gaiaColor = "ガイアカラー"
    /// HJモデラーズ
    case hjModelers = "HJモデラーズ"
    /// ファレホ
    case farejo = "ファレホ"
    /// MMP
    case MMP = "MMP"
    /// モデルマスター
    case modelMaster = "モデルマスター"
    /// Vカラー
    case vColor = "Vカラー"
    /// ボーンペイント
    case bonePaint = "ボーンペイント"
}

/// タイプ
enum PaintType: String, Hashable, CaseIterable {
    /// ビン・ボトル
    case bottle = "ビン・ボトル"
    /// 缶スプレー
    case spray = "缶スプレー"
    /// ペンタイプ
    case pen = "ペン"
    /// 溶剤
    case solvent = "溶剤"
    /// 添加物
    case additive = "添加物"
    /// ウェザリング用塗料
    case weathering = "ウェザリング用"
    /// 情景用塗料
    case scenes = "情景用"
    /// スミ入れ用塗料
    case sumi = "スミ入れ用"
}

/// 溶剤
enum Solvent: String, Hashable, CaseIterable {
    /// 水性
    case aqueous = "水性"
    /// 水性アクリル
    case aqueousAcrylic = "水性アクリル"
    /// ラッカー
    case lacquer = "ラッカー"
    /// エナメル
    case enamel = "エナメル"
    /// アルコール
    case alcohol = "アルコール"
}

/// 仕上がり
enum Finish: String, Hashable, CaseIterable {
    /// 光沢
    case gloss = "光沢"
    /// 半光沢
    case semiGloss = "半光沢"
    /// つや消し
    case matte = "つや消し"
    /// メタリックカラー
    case metallicColor = "メタリックカラー"
    /// クリアカラー
    case clearColor = "クリアカラー"
    /// パール・偏光カラー
    case polarizedColor = "パール・偏光カラー"
    /// 蛍光・蓄光カラー
    case luminousColor = "蛍光・蓄光カラー"
    /// サーフェイサー
    case surfacer = "サーフェイサー"
}
