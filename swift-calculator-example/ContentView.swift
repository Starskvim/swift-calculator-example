//
//  ContentView.swift
//  swift-calculator-example
//
//  Created by Михаил Гайволя on 27.10.2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    var body: some View {
        storyBoardView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct storyBoardView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = story.instantiateViewController(withIdentifier: "Home")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
