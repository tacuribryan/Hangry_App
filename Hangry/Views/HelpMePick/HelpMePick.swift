//
//  HelpMePick.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/25/23.
//

import SwiftUI


struct HelpMePick: View {
    @State private var selectedOption: String = ""
    @State private var untappedOption: String = ""
    @State private var isFinished: Bool = false
    @State private var howManyOptions: Int = 10
    @State private var foodOptions = ["Pizza", "Hamburger", "Hotdog", "Burrito", "Taco", "Sandwich", "Sesame Chicken", "Nachos", "Chilli", "Hummus", "Sweet Potato Fries", "Quesadilla", "Chicken Tenders", "Garlic Knots", "Milkshake", "Chicken Wings", "Buffalo Wings", "Doughnuts", "Chips and Guacamole", "Shrimp Tempura Roll", "Apple Pie", "Greek Salad", "Sushi", "Waffle Fries", "Macaroni and Cheese", "Miso Soup", "Mozzarella Sticks", "Hash browns"]
    
    @Binding var location: String
    
    func optionTapped(selectedOption: String) {
        self.selectedOption = selectedOption
        self.untappedOption = generateNewOption()
        
        howManyOptions -= 1
        print(foodOptions)
        if howManyOptions == 0 {
            isFinished = true
        }
        
        if let index = foodOptions.firstIndex(of: untappedOption) {
            foodOptions.remove(at: index)
        }
    }

    func generateInitialOptions() {
        let randomOptions = foodOptions.shuffled()
        selectedOption = randomOptions[0]
        untappedOption = randomOptions[1]
    }

    func generateNewOption() -> String {
//        let availableOptions = foodOptions.filter { $0 != selectedOption }
        return foodOptions.randomElement() ?? ""
    }
    
    var body: some View {
        //        Text("Help Me Pick")
        if isFinished {
            ResultView(selectedOption: selectedOption, location: $location)
        } else {
            VStack {
                Text(location)
                Text("Let me help you decide 😏")
                    .font(.largeTitle)
                Text("Which one do you prefer?")
                    .font(.largeTitle)
                    .padding()
                if !foodOptions.isEmpty {
                    VStack {
                        Button(action: {
                            optionTapped(selectedOption: untappedOption)
                        }) {
                            NavButton(title: untappedOption, foreground: .black, background: .white)
                                .padding(.bottom, 10)
//                            Text(untappedOption)
//                                .font(.headline)
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color.blue)
//                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            optionTapped(selectedOption: selectedOption)
                        }) {
                            NavButton(title: selectedOption, foreground: .black, background: .white)
                                .padding(.top, 10)
//                            Text(selectedOption)
//                                .font(.headline)
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color.blue)
//                                .cornerRadius(10)
                        }
                    }
                    
                }
            }
            .onAppear {
                generateInitialOptions()
            }
        }
    }
}

struct HelpMePick_Previews: PreviewProvider {
    static var previews: some View {
        HelpMePick(location: .constant("Norwalk CT"))
    }
}
