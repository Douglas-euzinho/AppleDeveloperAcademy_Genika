//
//  DailyGeneralModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 21/06/22.
//

import Foundation

class UserDataInput: ObservableObject{
    
    @Published var dataAlimentation:DataCollectorAlimentation
    @Published var dataEmotional:DataCollectorEmotional
    
    init(dataAlimentation:DataCollectorAlimentation,dataEmotional:DataCollectorEmotional){
        self.dataAlimentation = dataAlimentation
        self.dataEmotional = dataEmotional
    }
    
    convenience init() {
        self.init(dataAlimentation: DataCollectorAlimentation(), dataEmotional:DataCollectorEmotional(emojiCategory: DataCollectorEmojiCategory(category: "nil", quantifier: 0)))
    }
    
    func saveDatas(){
        dataEmotional.sendData()
        dataAlimentation.sendData()
//        PersistenceController.shared.getAlimentationCategory()
        PersistenceController.shared.getAlimentations()
//        PersistenceController.shared.getEmotional()
        var a = DataDailyGeneralCollector()
        a.setAlimentationArray(data: dataAlimentation)
        a.setEmotionalArray(data: dataEmotional)
        a.sendData()
        
        PersistenceController.shared.getDailyGeneral()
    }
    
}
