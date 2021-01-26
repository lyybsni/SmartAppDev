//
//  BodyWeightMontitor.swift
//  What2Eat
//
//  Created by Richard Li on 25/1/2021.
//

import SwiftUI

class UserData: ObservableObject{
    @Published var height: Double = 150
    @Published var weight: Double = 60
}

struct BodyWeight: Identifiable{
    let id: Int
    
    let date: Date
    let weight: Double
}

struct BodyWeightList: View{
    @State var weightList : [BodyWeight] = [
        BodyWeight(id:0, date: Date(), weight: 50.0)
    ]
    
    @State private var isAddingWeight: Bool = false
    @State private var enteredWeight: Double = 60
    
    @EnvironmentObject var data: UserData
    
    func toggleAddingRecord(){
        isAddingWeight = !isAddingWeight
    }
    
    var body: some View {
        NavigationView{
            List(weightList){ record in
                HStack{
                    Text("\(record.date)")
                    Text("\(record.weight)")
                }
            }
            .navigationBarTitle("WeightRecord")
            .navigationBarItems(
                trailing: Button(action:toggleAddingRecord, label: { Text("Add") })
            )
        }
        if isAddingWeight {
           HStack{
               Button("Cancel", action: toggleAddingRecord)
               Spacer()
               Text("Your weight: \(enteredWeight)")
               Spacer()
                Button("Submit", action: {
                    addRecord(date: Date(), weight: enteredWeight)
                    toggleAddingRecord()
                })
           }
           Slider(
                       value: $enteredWeight,
                       in: 30.0...100.0,
                       step: 0.2
                   )
       }
    }
    
    func addRecord(date: Date, weight: Double){
        weightList.append(BodyWeight(id: weightList.count, date: date, weight: weight))
        self.data.weight = weight
        print("Sub", self.data.weight, self.data.height)
    }
    
}


struct BodyWeightMonitorView: View{
    
    @State private var tempHeight = 50              // temp buffer of selection
    @State private var isSelectingHeight = false    // control if the picker is displayed
    
    @ObservedObject var data = UserData()
    
    /**
     For submitting the change upon user selection
     */
    func submitHeight(){
        self.data.height = Double(100 + tempHeight)
        toggleSelectHeight()
    }
    
    /**
     For toggling the pickle
     */
    func toggleSelectHeight(){
        isSelectingHeight = !isSelectingHeight
    }
    
    func computeBMI() -> Double{
        print("Main", self.data.weight, self.data.height)
        return (self.data.weight)*10000/Double(self.data.height*self.data.height)
    }
    

    
    var body: some View {
        
        VStack{
            
            // TODO: A canvas to visualize the body weight data
            // Functionality: a data record is consisted of (date, bodyweight), and BMI information is also displayed upon clicking
            
            BodyWeightList()
                .environmentObject(data)
            
            Divider()
            
            HStack{
                Text("Your height is: ")
                Button("\(tempHeight+100)", action: toggleSelectHeight)
            }
            
            ScrollView{
                Text("Your BMI is \(computeBMI())")
            }.frame(minHeight: 300)
            
            Divider()
            
            if isSelectingHeight{
                HStack{
                    Button("Cancel", action: toggleSelectHeight)
                    Spacer()
                    Text("Your height")
                    Spacer()
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


