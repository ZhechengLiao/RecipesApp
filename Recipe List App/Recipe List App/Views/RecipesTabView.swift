//
//  RecipesTabView.swift
//  Recipe List App
//
//  Created by 廖哲澄 on 2021/11/15.
//

import SwiftUI

struct RecipesTabView: View {
    var body: some View {
        TabView {
            RecipeFeaturedView().tabItem {
                VStack {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
                
            }
            
            RecipeListView().tabItem {
                VStack {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            }
        }.environmentObject(RecipeModel())
    }
}

struct RecipesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesTabView()
    }
}
