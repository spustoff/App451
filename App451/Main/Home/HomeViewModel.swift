//
//  HomeViewModel.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var entries: [EntryModel] = []
    
    @Published var isChart: Bool = false
    @Published var isAdd: Bool = false
    
    @Published var name: String = ""
    @Published var expenses: String = ""
    @Published var date: Date = Date()
    @Published var category: String = ""
    
    @Published var current_category: String = "All"
    @Published var categories: [String] = ["All", "Rent", "Salary", "Marketing"]
    
    func addEntry() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EntryModel", into: context) as! EntryModel
        
        loan.name = name
        loan.expenses = Int16(expenses) ?? 0
        loan.date = date
        loan.category = category
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchEntries() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EntryModel>(entityName: "EntryModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.entries = current_category == "All" ? result : result.filter{$0.category == current_category}
            
        } catch _ as NSError {
            
            self.entries = []
        }
    }
}
