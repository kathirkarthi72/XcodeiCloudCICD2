//
//  Home.swift
//  Count
//
//  Created by Kathiresan Murugan  on 07/10/24.
//

import SwiftUI

class CounterVM: ObservableObject {
    @Published var value: Int = 0
    
    func increment() {
        value += 1
    }
    
    func decrement() {
        value -= 1
    }
}

struct Home: View {
    
    @ObservedObject private var viewModel = CounterVM()
    
    var body: some View {
        NavigationView(content: {
            VStack(alignment: .center, spacing: 20, content: {
                Text("\(viewModel.value)")
                    .font(.system(size: 100))
                
                HStack(alignment: .center, spacing: 3, content: {
                    Button(action: viewModel.decrement, label: {
                        Spacer()
                        Image(systemName: "minus")
                            .font(.title)
                            .bold()
                        Spacer()
                    })
                    .background(content: {
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 50)
                    })
                    
                    Button(action: viewModel.increment, label: {
                        Spacer()
                        Image(systemName: "plus")
                            .font(.title)
                            .bold()
                        Spacer()
                    })
                    .background(content: {
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 50)
                    })
                    .background(content: {
                        Color.green
                    })

                })
                .foregroundStyle(Color.white)

                .frame(height: 50)
                .cornerRadius(10.0)
                .padding()
                
                    Text("Tap + Button to increment.\nTap - Button to decrement")
                    .font(.caption)
                .foregroundStyle(.secondary)
            })
            .navigationTitle("Tap to Count")
        })
        
    }
}

#Preview {
    Home()
}
