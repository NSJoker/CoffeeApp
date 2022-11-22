//
//  Coffee.swift
//  CoffeeApp
//
//  Created by Chandrachudh K on 10/11/22.
//

import Foundation

struct Coffee: Identifiable {
    var id: UUID = .init()
    var imageName: String
    var title: String
    var price: String
}

// A dummy collection of values for coffees
var coffees: [Coffee] = [
    Coffee(imageName: "Coffee1", title: "Caramel\nCold Drink", price: "$3.98"),
    Coffee(imageName: "Coffee2", title: "Caramel\nCold Drink", price: "$3.98"),
    Coffee(imageName: "Coffee3", title: "Caramel\nCold Drink", price: "$3.98"),
    Coffee(imageName: "Coffee1", title: "Caramel\nCold Drink", price: "$3.98"),
    Coffee(imageName: "Coffee2", title: "Caramel\nCold Drink", price: "$3.98"),
    Coffee(imageName: "Coffee3", title: "Caramel\nCold Drink", price: "$3.98"),
    Coffee(imageName: "Coffee1", title: "Caramel\nCold Drink", price: "$3.98")
]
