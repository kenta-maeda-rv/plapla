//
//  RepogitoryManager.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/07/18.
//

import Foundation
import RealmSwift

class RepogitoryManager {
    
    static let shared = RepogitoryManager()
    
    func realmPermanentlyDb() throws -> Realm {
        return try Realm()
    }
    
    //保存するためのパスを作成する
    func createLocalDataFile(id: String) -> URL {
        // 作成するテキストファイルの名前
        let fileName = "\(id).png"
        // DocumentディレクトリのfileURLを取得
        let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
        let path = documentDirectoryFileURL.appendingPathComponent(fileName)
        
        return path
    }
}
