//
//  BodyWeightMontitor.swift
//  What2Eat
//
//  Created by Richard Li on 25/1/2021.
//

import SwiftUI

struct BodyWeightMonitorView: View{
    
    @State private var selectedHeight = 50          // display information of user height
    @State private var tempHeight = 50              // temp buffer of selection
    @State private var isSelectingHeight = false    // control if the picker is displayed
    
    /**
     For submitting the change upon user selection
     */
    func submitHeight(){
        selectedHeight = tempHeight
        toggleSelectHeight()
    }
    
    /**
     For toggling the pickle
     */
    func toggleSelectHeight(){
        isSelectingHeight = !isSelectingHeight
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Your height is: ")
                Button("\(selectedHeight+100)", action: toggleSelectHeight)
            }
            
            Divider()
            
            // TODO: A canvas to visualize the body weight data
            // Functionality: a data record is consisted of (date, bodyweight), and BMI information is also displayed upon clicking
            
            Divider()
            
            HStack{
                Button("Add a record", action:{
                    // TODO: Add an modal of alert form to ask for user input of body weight
                })
            }
            
            Divider()
            
            if isSelectingHeight{
                HStack{
                    Button("Cancel", action: toggleSelectHeight)
                    Button("Submit", action: submitHeight)
                }
                Picker("Height", selection: $tempHeight){
                    ForEach(Range(100...200)){ height in
                        Text(String(height)).tag(height)
                    }
                }
            }
        }
    }
    
}
