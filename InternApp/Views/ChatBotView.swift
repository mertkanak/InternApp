////
////  SwiftUIView.swift
////  InternApp
////
////  Created by mert Kanak on 16.08.2023.
////
//

import SwiftUI

struct ChatBotView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to Aptern, How can I Help You"]
    
    var body: some View {
        VStack {
            HStack {
                Text("AppTern")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.blue)
            }
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    // If the message contains [USER], that means it's us
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        // User message styles
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        
                        // Bot message styles
                        HStack {
                            Text(message)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(Color.gray.opacity(0.1))
            
            
            // Contains the Message bar
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(getBotResponse(message: message))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}



//import SwiftUI
//import Combine
//
//struct ChatBotView: View {
//    var openAIService = OpenAIService()
//    var chatAPI = ChatGPTAPI(apiKey: "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")
//    @State private var messageText = ""
//    @State var messages: [String] = ["Welcome To AppTern"]
//    @State var cancellables: Set = Set<AnyCancellable>()
//    var body: some View {
//        VStack {
//            HStack{
//                Text("AppTern")
//                    .font(.largeTitle)
//                    .bold()
//
//                Image(systemName:"bubble.left.fill")
//                    .font(.system(size: 26))
//                    .foregroundColor(Color.blue)
//            }
//            ScrollView {
//                //Messages
//                ForEach(messages, id: \.self) { message in
//                    if message.contains("[USER]") {
//                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
//
//                        HStack {
//                            Spacer()
//                            Text(newMessage)
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(.blue.opacity(0.8))
//                                .cornerRadius(10)
//                                .padding(.horizontal, 16)
//                                .padding(.bottom, 10)
//                        }
//                    } else {
//                        HStack {
//
//                            Text(message)
//                                .padding()
//                                .background(.gray.opacity(0.15))
//                                .cornerRadius(10)
//                                .padding(.horizontal, 16)
//                                .padding(.bottom, 10)
//                            Spacer()
//                        }
//                    }
//                }
//            }
//
//            HStack{
//                TextField("Type something", text: $messageText)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(10)
//                    .onSubmit {
//                        sendMessage(message: messageText)
//                    }
//                Button {
//                    //sendMessag
//                    sendMessage(message: messageText)
//                } label: {
//                    Image(systemName: "paperplane.fill")
//                }
//                .font(.system(size: 26))
//                .padding(.horizontal, 10)
//            }
//            .padding()
//        }
//    }
//
//    func sendMessage(message: String) {
//            async {
//                do {
//                    let responseText = try await chatAPI.sendMessage(text: message)
//                    messages.append(message)
//                } catch {
//                    // Handle errors
//                    print("Error sending message: \(error)")
//                }
//            }
//        }
//    }
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatBotView()
//    }
//}
//
//
//
