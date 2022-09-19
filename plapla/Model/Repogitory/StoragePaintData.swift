//
//  StoragePaintData.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/09/18.
//

import Foundation
import RealmSwift
import UniformTypeIdentifiers

extension RepogitoryManager {
    // DBContent
    var paintDataPermanentlyDb: Results<Paint>? {
        (try? realmPermanentlyDb())?.objects(Paint.self)
    }

    ///  コンテンツの保存
    func savePaintData(
        color: PaintColor,
        brand: PaintBrand,
        type: PaintType,
        solvent: Solvent,
        finish: Finish
    ) {
        let realm = try? realmPermanentlyDb()

        let id = UUID().uuidString

        do {
            try realm?.write {
                let db = Paint(id: id,
                               color: color,
                               brand: brand,
                               type: type,
                               solvent: solvent,
                               finish: finish,
                               quantity: 100)
                realm?.add(db)
                logger.debug("塗料データの保存に成功")
            }
        } catch {
            logger.error("塗料データの保存に失敗")
        }
    }

    func updatePaintQuantityData(
        id: String,
        quantity: Double? = nil
    ) {
        do {
            let realm = try? realmPermanentlyDb()
            if let result = try realmPermanentlyDb().objects(Paint.self).filter("id == %@", id).first {
                try? realm?.write {
                    if let quantity = quantity { result.quantity = quantity }
                }
            }
        } catch {
            logger.error("塗料データの更新に失敗")
        }
    }

    func getPaintData() -> [Paint] {
        var result: [Paint] = []
        guard let paintDatas = RepogitoryManager.shared.paintDataPermanentlyDb else {
            print("投稿データの取得失敗")
            return result
        }

        let data = paintDatas.map { Paint(id: $0.id,
                                          color: PaintColor(rawValue: $0.colorName!) ?? .green,
                                          brand: PaintBrand(rawValue: $0.brand!) ?? .gundamColor,
                                          type: PaintType(rawValue: $0.type!) ?? .bottle,
                                          solvent: Solvent(rawValue: $0.solvent!) ?? .lacquer,
                                          finish: Finish(rawValue: $0.finish!) ?? .clearColor,
                                          quantity: $0.quantity)
        }
        result.append(contentsOf: data)
        print("取得したコンテンツデータ\(result)")
        return result
    }
}
