//
//  SMBViewModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import Foundation
import SwiftUI

class SMBViewModel: ObservableObject{
    //llega el mensaje dle usuario de TextField
    @Published var messages: [Message] = []
    //la respuesta de la api se almacena aqui, como llega a las demas vistas?
    @Published var apiResponse: [ApiResponse] = []
    
    let smbModel = SMBModel()
    
//    func performRequest(){
//        smbModel.performRequest(messages, arrayMessage: &apiResponse)
//    }
}
