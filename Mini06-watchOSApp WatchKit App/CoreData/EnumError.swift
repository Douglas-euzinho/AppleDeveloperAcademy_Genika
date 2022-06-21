//
//  EnumError.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 20/06/22.
//

import UIKit

enum ErrorType: String, Error{
    case notSaved = "Error to save the context in CoreData"
    case notDeleted = "Error to delete the context in CoreData"
}

enum SucessType: String, Error{
    case sucessSaving = "Saved with sucess the context in CoreData"
    case sucessDeleting = "Deleted with sucess the context in CoreData"
}

enum FetchError: String, Error{
    case errorEmoji = "Unnable to save emoji"
    case errorAlimentation = "Unnable to save alimentation"
    case errorSleep = "Unnable to save sleep"
    case errorExercice = "Unnable to save exercice"
}
