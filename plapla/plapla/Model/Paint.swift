//
//  Paint.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/15.
//

import Foundation
import SwiftUI

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
}

enum PaintBrand {
    /// タミヤアクリルミニ
    case tamiyaAcrylicMini
    /// タミヤラッカー
    case tamiyalacquer
    /// タミヤエナメル
    case tamiyaEnamel
    /// Mr.カラー
    case mrColor
    /// ガンダムカラー
    case gundamColor
    /// ガンダムマーカー
    case gundamMarker
    /// 水性ホビーカラー
    case aqueousHobbyColor
    /// アクリジョン
    case acrysion
    /// ガイアカラー
    case gaiaColor
    /// HJモデラーズ
    case hjModelers
    /// ファレホ
    case farejo
    /// MMP
    case MMP
    /// モデルマスター
    case modelMaster
    /// Vカラー
    case vColor
    /// ボーンペイント
    case bonePaint
}

/// タイプ
enum PaintType {
    /// ビン・ボトル
    case bottle
    /// 缶スプレー
    case spray
    /// ペンタイプ
    case pen
    /// 溶剤
    case solvent
    /// 添加物
    case additive
    /// ウェザリング用塗料
    case weathering
    /// 情景用塗料
    case scenes
    /// スミ入れ用塗料
    case sumi
}

/// 溶剤
enum Solvent {
    /// 水性
    case aqueous
    /// 水性アクリル
    case aqueousAcrylic
    /// ラッカー
    case lacquer
    /// エナメル
    case enamel
    /// アルコール
    case alcohol
}

/// 仕上がり
enum finish {
    /// 光沢
    case gloss
    /// 半光沢
    case semiGloss
    /// つや消し
    case matte
    /// メタリックカラー
    case metallicColor
    /// クリアカラー
    case clearColor
    /// パール・偏光カラー
    case polarizedColor
    /// 蛍光・蓄光カラー
    case luminousColor
    /// サーフェイサー
    case surfacer
}
