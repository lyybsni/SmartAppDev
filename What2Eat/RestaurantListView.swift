//
//  RestaurantListView.swift
//  What2Eat
//
//  Created by Richard Li on 27/1/2021.
//

import SwiftUI

struct Restaurant: Identifiable{
    let id: Int
    
    let name: String
    let location: String?
    let rank: Double?
    let image: String? // uri of the restaurant picture
    
    init(id: Int, name: String, location: String? = nil, rank: Double? = nil, image: String? = nil){
        self.id = id
        self.name = name
        
        self.location = location
        self.rank = rank
        self.image = image
    }
}

struct RestaurantList: View{
    
    @State private var list: [Restaurant] = [
        Restaurant(id:0, name:"McDonald"),
        Restaurant(id:1, name:"KFC"),
        Restaurant(id:2, name:"HelloWorld"),
        Restaurant(id:3, name:"Don'tEat"),
    ]
    
    var body: some View{
        NavigationView{
            List{
                ForEach(list, content: { record in
                    Text("\(record.name)")
                })
            }
            .navigationBarTitle("Restaurant")
            .navigationBarItems(
                trailing: Button(action:{}, label: { Text("Add") })
            )
        }
    }
    
}
