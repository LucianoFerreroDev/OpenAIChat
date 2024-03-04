//
//  ChatViewModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 28/2/24.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    
    @Published var chats: [Chat] = []
    @Published var message: [Message] = []
    @Published var messagesList: Set<Message> = []

    let chatModel = ChatModel.shared
    let messageModel = MessageModel.shared
    
    @Published var chatTitle: String = ""
    @Published var messageContent: String = ""
    
    init() {
        getAllChats()
        getAllMessages()
    }
    
    //Chats
    func getAllChats() {
        chats = chatModel.read()
    }
    
    func createChat() {
        chatModel.create(title: chatTitle, messages: messagesList)
        getAllChats()
    }
    
    func delateChat(chat: Chat) {
        chatModel.delate(chat)
        getAllChats()
    }
    
    //Messages
    func getAllMessages() {
        message = messageModel.read()
    }
    
    func createMessage() {
        messageModel.create(content: messageContent , role: "user")
        getAllMessages()
    }
    
}
