//
//  Home.swift
//  CoffeeApp
//
//  Created by Chandrachudh K on 10/11/22.
//

import SwiftUI

let multipyingFactor: CGFloat = 1

struct Home: View {
    
    @State var offsetY: CGFloat = 0
    @State var currentIndex: CGFloat = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let cardSize = size.width * multipyingFactor
            
            // This will be the bg
            LinearGradient(colors: [
                Color.clear,
                Color("Brown").opacity(0.2),
                Color("Brown").opacity(0.45),
                Color("Brown")
            ], startPoint: .top, endPoint: .bottom)
            .frame(height: 300)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
            HeaderView()
            
            VStack(spacing: 0) {
                ForEach(coffees) { coffee in
                    CoffeeView(coffee: coffee, size: size)
                }
            }
            .frame(width: size.width)
            .padding(.top, size.height - cardSize)
            .offset(y: offsetY)
            .offset(y: -currentIndex * cardSize)
        }
        .coordinateSpace(name: "SCROLL")
        .contentShape(Rectangle())
        .gesture(
            // this is purley mathematical. We have to use the spacial awarness here
            DragGesture()
                .onChanged({ value in
                    offsetY = value.translation.height * 0.4
                })
                .onEnded({ value in
                    let translation = value.translation.height
                    
                    withAnimation(.easeInOut) {
                        if translation > 0 {
                            if currentIndex > 0 && translation > 250 {
                                currentIndex -= 1
                            }
                        } else {
                            if currentIndex < CGFloat(coffees.count - 1) && -translation > 250 {
                                currentIndex += 1
                            }
                        }
                        offsetY = .zero
                    }
                })
        )
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                }

                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "cart.fill")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                }
            }
            
            GeometryReader {
                let size = $0.size
                
                HStack(spacing: 0) {
                    ForEach(coffees) { coffee in
                        VStack(spacing: 15) {
                            Text(coffee.title)
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                            
                            Text(coffee.price)
                                .font(.title)
                            
                        }
                        .frame(width: size.width)
                    }
                }
                .offset(x: currentIndex * -size.width)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8), value: currentIndex)
            }
            .padding(.top, -5)
        }
        .padding(15)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
