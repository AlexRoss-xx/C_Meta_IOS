//
//  test.swift
//  Little Lemon
//
//  Created by Cristian Misael Almendro Lazarte on 19/3/23.
//

import Foundation

struct JSONMenu: Codable {
  let list: [FoodItem]
}

struct FoodItem: Codable {
  let name: String
  let price: String
  let description: String
}
