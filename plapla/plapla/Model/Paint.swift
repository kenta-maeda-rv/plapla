//
//  Paint.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/15.
//

import Foundation
import SwiftUI

/// 塗料
struct Paint {
    /// 塗料カラー
    var color: PaintColor
    /// ブランド
    var brand: PaintBrand
    /// タイプ
    var type: PaintType
    /// 溶剤
    var solvent: Solvent
    /// 仕上がり
    var finish: Finish
    
}

/// 塗料カラー
enum PaintColor {
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
        case .red: return UIColor(red: 254, green: 39, blue: 18, alpha: 1)
        case .orange: return UIColor(red: 251, green: 153, blue: 2, alpha: 1)
        case .yellow: return UIColor(red: 254, green: 254, blue: 51, alpha: 1)
        case .green: return UIColor(red: 102, green: 176, blue: 50, alpha: 1)
        case .sky: return UIColor(red: 135, green: 206, blue: 235, alpha: 1)
        case .blue: return UIColor(red: 36, green: 84, blue: 165, alpha: 1)
        case .purple: return UIColor(red: 134, green: 1, blue: 175, alpha: 1)
        case .pink: return UIColor(red: 228, green: 0, blue: 127, alpha: 1)
        case .brown: return UIColor(red: 123, green: 55, blue: 30, alpha: 1)
        case .fresh: return UIColor(red: 246, green: 234, blue: 222, alpha: 1)
        case .tan: return UIColor(red: 163, green: 137, blue: 134, alpha: 1)
        case .khaki: return UIColor(red: 187, green: 160, blue: 74, alpha: 1)
        case .darkGreen: return UIColor(red: 48, green: 67, blue: 46, alpha: 1)
        case .oliveGreen: return UIColor(red: 127, green: 142, blue: 105, alpha: 1)
        case .greenGray: return UIColor(red: 155, green: 171, blue: 169, alpha: 1)
        case .blueGray: return UIColor(red: 83, green: 155, blue: 153, alpha: 1)
        case .gold: return UIColor(red: 230, green: 180, blue: 34, alpha: 1)
        case .silver: return UIColor(red: 192, green: 192, blue: 192, alpha: 1)
        case .copper: return UIColor(red: 184, green: 115, blue: 51, alpha: 1)
        case .clear: return UIColor(red: 250, green: 250, blue: 250, alpha: 1)
        case .black: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .gray: return UIColor(red: 128, green: 128, blue: 128, alpha: 1)
        case .white: return UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        }
    }
}

/// ブランド
enum PaintBrand {
    /// タミヤアクリルミニ
    static let tamiyaAcrylicMini = "タミヤアクリルミニ"
    /// タミヤラッカー
    static let tamiyalacquer = "タミヤラッカー"
    /// タミヤエナメル
    static let tamiyaEnamel = "タミヤエナメル"
    /// Mr.カラー
    static let mrColor = "Mr.カラー"
    /// ガンダムカラー
    static let gundamColor = "ガンダムカラー"
    /// ガンダムマーカー
    static let gundamMarker = "ガンダムマーカー"
    /// 水性ホビーカラー
    static let aqueousHobbyColor = "水性ホビーカラー"
    /// アクリジョン
    static let acrysion = "アクリジョン"
    /// ガイアカラー
    static let gaiaColor = "ガイアカラー"
    /// HJモデラーズ
    static let hjModelers = "HJモデラーズ"
    /// ファレホ
    static let farejo = "ファレホ"
    /// MMP
    static let MMP = "MMP"
    /// モデルマスター
    static let modelMaster = "モデルマスター"
    /// Vカラー
    static let vColor = "Vカラー"
    /// ボーンペイント
    static let bonePaint = "ボーンペイント"
}

/// タイプ
enum PaintType {
    /// ビン・ボトル
    static let bottle = "ビン・ボトル"
    /// 缶スプレー
    static let spray = "缶スプレー"
    /// ペンタイプ
    static let pen = "ペン"
    /// 溶剤
    static let solvent = "溶剤"
    /// 添加物
    static let additive = "添加物"
    /// ウェザリング用塗料
    static let weathering = "ウェザリング用"
    /// 情景用塗料
    static let scenes = "情景用"
    /// スミ入れ用塗料
    static let sumi = "スミ入れ用"
}

/// 溶剤
enum Solvent {
    /// 水性
    static let aqueous = "水性"
    /// 水性アクリル
    static let aqueousAcrylic = "水性アクリル"
    /// ラッカー
    static let lacquer = "ラッカー"
    /// エナメル
    static let enamel = "エナメル"
    /// アルコール
    static let alcohol = "アルコール"
}

/// 仕上がり
enum Finish {
    /// 光沢
    static let gloss = "光沢"
    /// 半光沢
    static let semiGloss = "半光沢"
    /// つや消し
    static let matte = "つや消し"
    /// メタリックカラー
    static let metallicColor = "メタリックカラー"
    /// クリアカラー
    static let clearColor = "クリアカラー"
    /// パール・偏光カラー
    static let polarizedColor = "パール・偏光カラー"
    /// 蛍光・蓄光カラー
    static let luminousColor = "蛍光・蓄光カラー"
    /// サーフェイサー
    static let surfacer = "サーフェイサー"
}
