//
//  TextFieldModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import Foundation

class TextFieldModel{
    let messageModel = MessageModel.shared
    let userMessages: [Message] = []

    func createUserMessage(content: String){
        messageModel.create(content: content, role: "user")
    }
}
