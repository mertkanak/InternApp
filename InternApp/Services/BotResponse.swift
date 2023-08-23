import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey there!"
    } else if tempMessage.contains("hi") {
        return "Hello! How can I assist you?"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, thank you. How about yourself?"
    } else if tempMessage.contains("goodbye") {
        return "Farewell! Have a great day!"
    } else if tempMessage.contains("bye") {
        return "Take care! Let's chat again soon."
    } else if tempMessage.contains("what is your name") {
        return "I'm a bot created to assist and chat with you."
    } else if tempMessage.contains("how is the weather") {
        return "I'm not equipped with real-time data, but you can check your favorite weather website!"
    } else if tempMessage.contains("tell me a joke") {
        return "Sure, here's one: Why don't scientists trust atoms? Because they make up everything!"
    } else if tempMessage.contains("give a1"){
        return "Age is an important aspect of life. As we grow older, we gain more experience and wisdom. It's a natural process that everyone goes through. In many cultures, reaching a certain age is celebrated as a milestone."
    } else if tempMessage.contains("give a2"){
        return "Agreed, communication plays a crucial role in building strong bonds between people. When we agree on certain ideas or decisions, it helps us create a harmonious environment. In today's world, using technology to communicate has become the norm. We can quickly zap messages to friends and family, making connections easier than ever before."
    } else {
        return "That's interesting. Tell me more!"
    }
}
