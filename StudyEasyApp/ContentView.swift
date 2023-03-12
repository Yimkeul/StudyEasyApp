//
//  ContentView.swift
//  StudyEasyApp
//
//  Created by yimkeul on 2023/03/10.
//

import SwiftUI



struct ContentView: View {
    
    var colors : [Color] = [.black, .red, .green, .blue]
    var colornames : [String] = ["black", "red", "green", "blue"]
    
    @State private var colorIndex = 0
    @State private var rotation : Double = 0.0;
    @State private var text : String = "Welcome to SwfitUI";
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(Angle(degrees: rotation))
                .animation(.easeOut(duration: 5) , value: rotation)
                .foregroundColor(colors[colorIndex])
            Spacer()
            Divider()
            Slider(value: $rotation,in: 0 ... 360 , step : 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Picker("Color",selection: $colorIndex ){
                ForEach(0 ..< colornames.count , id : \.self){ index in                     Text(colornames[index])
                        .foregroundColor(colors[index])
                }
            }.pickerStyle(.wheel)
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
