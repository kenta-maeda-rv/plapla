//
//  ScreenUtil.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import Foundation
import UIKit

class ScreenUtil {
    class func dateFormatterToYYYYMMdd(date: Date) -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "yyyyMMdd"

        let dateString = dateFormatter.string(from: date)

        return dateString
    }

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
            } else {
                print("画像ファイルの読み込みに失敗")
            }
        } else {
            print("画像ファイルが存在しない")
        }
        return nil
    }
}
