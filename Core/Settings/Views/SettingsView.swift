//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Evgeny on 18.04.22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let personalURL = URL(string: "https://github.com/evyios")!
    
    var body: some View {
        NavigationView {
            List {
                info
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("INFO")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var info: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This application was created by Evgeny Yachny. It uses MVVM Architecture, Combine and Core Data.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical)
            Link("YouTube 🔴", destination: youtubeURL)
            Link("Google 🔥", destination: defaultURL)
            Link("My GitHub ⭐️", destination: personalURL)
        } header: {
            Text("Useful links")
        }
    }
}
