//
//  ContentView.swift
//  SwiftUIWeatherApp
//
//  Created by nik.dany on 04.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
            
                Text(viewModel.title)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10){
                    Image(systemName: "\(viewModel.imageName)")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text(viewModel.descriptionText)
                        .font(.system(size: 32, weight: .medium))
                        .foregroundColor(.white)
                    Text(viewModel.temperature)
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(.white)
                }
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
