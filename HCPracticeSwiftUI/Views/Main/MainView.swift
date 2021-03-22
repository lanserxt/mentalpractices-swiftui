//
//  ContentView.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let viewModel: MainViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Practice.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Practice>
    
    var body: some View {
        NavigationView {            
            List {
                ForEach(items) { item in
                    NavigationLink(
                        destination: PracticeDetail(practice: item),
                        label: {
                            PracticeRow(practice: item)
                        })
                }
            }
            .navigationBarTitle("Practices")
        }.onAppear(perform: {
            if items.count == 0 {
                viewModel.loadPractices()
            }
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(viewContext: PersistenceController.preview.container.viewContext))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
