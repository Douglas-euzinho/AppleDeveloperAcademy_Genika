//
//  DailyGeneralModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/06/22.
//

import Foundation

class UserDataInput: ObservableObject {
    
    @Published var dataAlimentation: DataCollectorAlimentation
    @Published var dataEmotional: DataCollectorEmotional
    
    init(dataAlimentation: DataCollectorAlimentation, dataEmotional: DataCollectorEmotional) {
        self.dataAlimentation = dataAlimentation
        self.dataEmotional = dataEmotional
    }
    
    convenience init() {
        self.init(dataAlimentation: DataCollectorAlimentation(),
                  dataEmotional: DataCollectorEmotional(emojiCategory: DataCollectorEmojiCategory(category: "nil", quantifier: 0)))
    }
    
    func saveData() {
        let _ = dataEmotional.sendData()
        let _ = dataAlimentation.sendAlimentationCategory()
    }
    
    func saveAlimentation() { }
}
