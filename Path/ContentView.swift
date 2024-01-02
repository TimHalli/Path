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
            
            VStack(spacing: 0) {
                ForEach(1..<10, id: \.self) { columnIndex in
                    
                    HStack(spacing: 0) {
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
                    }
                }
               
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
