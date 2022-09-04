//
//  ScreenUtil.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import Foundation
import UIKit

class ScreenUtil {
    class func getImage(id: String?) -> UIImage? {
        guard let id = id else {
            print("contentIdが存在しない")
            return nil
        }
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                       .userDomainMask, true).first ?? ""
        let filePath = path + "/" + "\(id).png"
        print("検索するfilePath:\(filePath)")
        if FileManager.default.fileExists(atPath: filePath) {
            if let imageData = UIImage(contentsOfFile: filePath) {
                return imageData
            }
            else {
                print("画像ファイルの読み込みに失敗")
            }
        } else {
            print("画像ファイルが存在しない")
        }
        return nil
    }
}
