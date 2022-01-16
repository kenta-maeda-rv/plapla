//
//  Content.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import Foundation

struct Content: Identifiable {
    
    var id = UUID().uuidString
    var contentTitle: String
    var contentDrscription: String
    var contentDate: Date
    
}
