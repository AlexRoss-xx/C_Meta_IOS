//
//  DisplayDish.swift
//  Little Lemon
//
//  Created by Alexey Rasskazov on 05/10/2024.
//

import SwiftUI

struct DisplayDish: View {
    @ObservedObject private var dish:Dish
    init(_ dish:Dish) {
        self.dish = dish
    }
    
    var body: some View {
        HStack{
            Text(dish.name ?? "")
                .padding([.top, .bottom], 7)
            
            Spacer()
            
            Text(dish.formatPrice())
            //.monospaced()
                .font(.callout)
        }
        .contentShape(Rectangle())
    }
}
