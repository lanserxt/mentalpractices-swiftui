//
//  MainViewModel.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//

import SwiftUI
import CoreData
import Combine

final class MainViewModel: ObservableObject {
    
    private var viewContext : NSManagedObjectContext
    private let apiManager : APIManager
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published
    var havePractices: Bool = false
    
    @Published
    var loading: Bool = false
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        self.apiManager = APIManager(viewContext: viewContext)
    }
    
    func loadPractices() {
        apiManager.getPractices().sink {[weak self] (result) in
            switch result {
            case .failure(let error): print("Error \(error)")
            case .finished:
                break
            }
            self?.loading = false
        } receiveValue: {[weak self] (container) in
            if container.data.count > 0 {
                self?.havePractices = true
            }
            self?.saveIfNeeded()
        }
        .store(in: &cancellables)
        
    }
    
    private func saveIfNeeded() {
        do {
            if viewContext.hasChanges {
                try viewContext.save()
            }
        } catch {
            
        }
    }
}
