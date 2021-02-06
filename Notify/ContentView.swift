//
//  ContentView.swift
//  Notifi
//
//  Created by Chris Patterson on 2/5/20.
//  Copyright © 2020 Chris Patterson. All rights reserved.
//

import SwiftUI
import UserNotifications


struct ContentView: View {
    @State private var messageTitle: String = ""
    @State private var messageText: String = ""

    var body: some View {
        
        VStack {
            Text("What reminder would you like create?")
                .bold()
                .padding()
            TextField("Title", text: $messageTitle)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Message", text: $messageText)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .textFieldStyle(RoundedBorderTextFieldStyle())

                

            Button("Schedule Notification") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                let content = UNMutableNotificationContent()
                content.title = self._messageTitle.wrappedValue
                content.subtitle = self._messageText.wrappedValue
                content.sound = UNNotificationSound.default

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
