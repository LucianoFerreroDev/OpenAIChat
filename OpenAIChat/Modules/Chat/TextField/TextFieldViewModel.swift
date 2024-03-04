//
//  TextFieldViewModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import Foundation
import SwiftUI

class TextFieldViewModel: ObservableObject{
    let textFieldModel: TextFieldModel = TextFieldModel()
    let messageModel = MessageModel.shared
    @Published var messageContent: String = ""
    @Published var messagesList: [Message] = []
    
    init(){
        getAllMessage()
    }
    
    func getAllMessage(){
        messagesList = messageModel.read()
        print(messagesList)
    }
    
    func createUserMessage(){
        textFieldModel.createUserMessage(content: messageContent)
        getAllMessage()
    }
}
