//
//  PathApp.swift
//  Path
//
//  Created by Tim Halli on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width * 0.1
            let height = geometry.size.height * 0.1
            let rectangle = CGRect(x: .zero, y: .zero, width: width , height: height)
            
            ScrollView {
                Spacer()
                
                LazyVGrid(columns: [GridItem(.fixed(20))], spacing: 0, content: {
                    ForEach(1..<10, id: \.self) { columnIndex in
                        
                            LazyHGrid(rows: [GridItem(.fixed(20))], spacing: 0, content: {
                                ForEach(1..<10, id: \.self) { rowIndex in
                                    
                                    Path { path in
                                        path.addRect(rectangle)
                                    }
                                    .fill((columnIndex + rowIndex) % 2 == 0 ? .yellow : .white)
                                    .border(.gray, width: 1)
                                    .frame(width: width, height: height)
                                    .overlay(
                                        Text("\(columnIndex * rowIndex)")
                                            .foregroundColor(.black)
                                            .bold()
                                    )
                                }
                            })
                    }
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
