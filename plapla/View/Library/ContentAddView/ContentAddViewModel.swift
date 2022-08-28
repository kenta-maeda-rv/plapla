//
//  ContentAddViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

class ContentAddViewModel: ObservableObject {
    
    func tapAddButton(
        title: String,
        discription: String,
        image: UIImage
    ) {
        RepogitoryManager.shared.saveContent(contentTitle: title,
                                             contentDiscription: discription,
                                             contentImage: image,
                                             lastEditDate: Date())
    }
}
