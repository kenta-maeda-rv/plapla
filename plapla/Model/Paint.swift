//
//  Paint.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/15.
//

import Foundation
import SwiftUI

/// 塗料
struct Paint: Identifiable {
    // 固有id
    var id = UUID().uuidString
    /// 塗料カラー名
    var colorName: String
    /// 塗料カラー
    var color: UIColor
    /// ブランド
    var brand: String
    /// タイプ
    var type: String
    /// 溶剤
    var solvent: String
    /// 仕上がり
    var finish: String
    
}

/// 塗料カラー
enum PaintColor: CaseIterable {
    /// レッド
    case red
    /// オレンジ
    case orange
    /// イエロー
    case yellow
    /// グリーン
    case green
    /// スカイ
    case sky
    /// ブルー
    case blue
    /// パープル
    case purple
    /// ピンク
    case pink
    /// ブラウン
    case brown
    /// フレッシュ
    case fresh
    /// タン
    case tan
    /// カーキ
    case khaki
    /// ダークグリーン
    case darkGreen
    /// オリーブグリーン
    case oliveGreen
    /// グリーングレー
    case greenGray
    /// ブルーグレー
    case blueGray
    /// ゴールド
    case gold
    /// シルバー
    case silver
    /// カッパー
    case copper
    /// クリア
    case clear
    /// ブラック
    case black
    /// グレー
    case gray
    /// ホワイト
    case white
    
    var colorString: String {
        switch self {
        case .red: return "レッド"
        case .orange: return "オレンジ"
        case .yellow: return "イエロー"
        case .green: return "グリーン"
        case .sky: return "スカイ"
        case .blue: return "ブルー"
        case .purple: return "パープル"
        case .pink: return "ピンク"
        case .brown: return "ブラウン"
        case .fresh: return "フレッシュ"
        case .tan: return "タン"
        case .khaki: return "カーキ"
        case .darkGreen: return "ダークグリーン"
        case .oliveGreen: return "オリーブグリーン"
        case .greenGray: return "グリーングレー"
        case .blueGray: return "ブルーグレー"
        case .gold: return "ゴールド"
        case .silver: return "シルバー"
        case .copper: return "カッパー"
        case .clear: return "クリア"
        case .black: return "ブラック"
        case .gray: return "グレー"
        case .white: return "ホワイト"
        }
    }
    
    var color: UIColor {
        switch self {
        case .red: return UIColor(red: 254/255, green: 39/255, blue: 18/255, alpha: 1)
        case .orange: return UIColor(red: 251/255, green: 153/255, blue: 2/255, alpha: 1)
        case .yellow: return UIColor(red: 254/255, green: 254/255, blue: 51/255, alpha: 1)
        case .green: return UIColor(red: 102/255, green: 176/255, blue: 50/255, alpha: 1)
        case .sky: return UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)
        case .blue: return UIColor(red: 36/255, green: 84/255, blue: 165/255, alpha: 1)
        case .purple: return UIColor(red: 134/255, green: 1/255, blue: 175/255, alpha: 1)
        case .pink: return UIColor(red: 228/255, green: 0/255, blue: 127/255, alpha: 1)
        case .brown: return UIColor(red: 123/255, green: 55/255, blue: 30/255, alpha: 1)
        case .fresh: return UIColor(red: 246/255, green: 234/255, blue: 222/255, alpha: 1)
        case .tan: return UIColor(red: 163/255, green: 137/255, blue: 134/255, alpha: 1)
        case .khaki: return UIColor(red: 187/255, green: 160/255, blue: 74/255, alpha: 1)
        case .darkGreen: return UIColor(red: 48/255, green: 67/255, blue: 46/255, alpha: 1)
        case .oliveGreen: return UIColor(red: 127/255, green: 142/255, blue: 105/255, alpha: 1)
        case .greenGray: return UIColor(red: 155/255, green: 171/255, blue: 169/255, alpha: 1)
        case .blueGray: return UIColor(red: 83/255, green: 155/255, blue: 153/255, alpha: 1)
        case .gold: return UIColor(red: 230/255, green: 180/255, blue: 34/255, alpha: 1)
        case .silver: return UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        case .copper: return UIColor(red: 184/255, green: 115/255, blue: 51/255, alpha: 1)
        case .clear: return UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        case .black: return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        case .gray: return UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        case .white: return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
    }
}

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
