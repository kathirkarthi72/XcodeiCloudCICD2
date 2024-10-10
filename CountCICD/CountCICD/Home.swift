//
//  Home.swift
//  Count
//
//  Created by Kathiresan Murugan  on 07/10/24.
//

import SwiftUI
import SwiftData


class CounterVM: ObservableObject {
    @AppStorage("count") var count: Int = 0

    func increment() {
        withAnimation(.linear, {
            count += 1
        })
    }
    
    func decrement() {
        withAnimation(.bouncy, {
            count -= 1
        })
    }
}

struct Home: View {
    
    @ObservedObject private var viewModel = CounterVM()
    
    var body: some View {
        NavigationView(content: {
            VStack(alignment: .center, spacing: 20, content: {
                Text("\(viewModel.count)")
                    .font(.system(size: 100))
                
                HStack(alignment: .center, spacing: 3, content: {
                    Button(action: viewModel.decrement, label: {
                        Spacer()
                        Label("1", systemImage: "minus")
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
                        Label("1", systemImage: "plus")
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
                
                    Text("Simple counting application.")
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
