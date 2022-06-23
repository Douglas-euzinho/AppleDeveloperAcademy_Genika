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
        self.init(dataAlimentation: DataCollectorAlimentation(), dataEmotional:DataCollectorEmotional())
    }
    
    func saveDatas(){
//        for i in 0...dataAlimentation.alimentationCategory.count{
//            do {
//                let teste = try PersistenceController.shared.alimentationCategory(category: dataAlimentation.alimentationCategory[i].alimentationCategory!, quantifier: dataAlimentation.alimentationCategory[i].quantifier)
//            } catch {
//
//            }
//        }
        let teste = try PersistenceController.shared.alimentationCategory(category: dataAlimentation.alimentationCategory, quantifier: dataAlimentation.alimentationCategory. quantifier)
        
        PersistenceController.shared.alimentation(
            breakCount: dataAlimentation.breakCount,
            point: dataAlimentation.point,
            waterCount: dataAlimentation.waterCount!,
            alimentationCategory: dataAlimentation.alimentationCategory,
            meal: dataAlimentation.mealCategory)
    }
    
}
