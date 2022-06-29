//
//  DailyGeneralModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/06/22.
//

import Foundation

class UserDataInput: ObservableObject {
    @Published var dataEmotional: DataCollectorEmotional
    @Published var dataAlimentation: DataCollectorAlimentation
    
    init(dataAlimentation: DataCollectorAlimentation, dataEmotional: DataCollectorEmotional) {
        self.dataAlimentation = dataAlimentation
        self.dataEmotional = dataEmotional
    }
    
    convenience init() {
        self.init(dataAlimentation: DataCollectorAlimentation(),
                  dataEmotional: DataCollectorEmotional(emojiCategory: DataCollectorEmojiCategory(category: "nil", quantifier: 0)))
    }
    
    func saveData(sleep: Sleep) throws {
        var persistence = PersistenceController.shared
        let emotional = try dataEmotional.saveData()
        let alimentation = try dataAlimentation.saveData()
        
        try persistence.createDailyGeneral(alimentation: alimentation,
                                           emotional: emotional,
                                           sleep: sleep)
    }
}
