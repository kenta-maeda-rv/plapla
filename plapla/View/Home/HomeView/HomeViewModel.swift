//
//  HomeViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI
import RealmSwift

class HomeViewModel: ObservableObject {
    
    @Published var contents: [Content] = [
    
//        Content(contentTitle: Process.temporaryAssembly.processString, contentDrscription: "とりあえず", lastEditDate: Date(),postData: []),
//        Content(contentTitle: Process.painting.processString, contentDrscription: "下地サフ", lastEditDate: Date(),postData: []),
//        Content(contentTitle: Process.assembly.processString, contentDrscription: "完成", lastEditDate: Date(),postData: [])
//    
    ]
    init() {
        self.initScreenData()
    }
    
    func initScreenData() {
        guard let contentDatas = RepogitoryManager.shared.contentPermanentlyDb else {
            logger.debug("DB取得に失敗")
            return
        }
        
        let data = contentDatas.map{Content(contentId: $0.contentId,
                                            contentTitle: $0.contentTitle,
                                            contentDiscription: $0.contentDiscription,
                                            contentImageUrl: $0.contentImageUrl,
                                            lastEditDate: $0.lastEditDate)}
        print("取得したコンテンツデータ\(data)")
        self.contents.append(contentsOf: data)
    }
    
    func getImage(contentId: String?) -> UIImage? {
        guard let contentId = contentId else {
            print("contentIdが存在しない")
            return nil
        }
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        let filePath = path + "/" + "\(contentId).png"
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
