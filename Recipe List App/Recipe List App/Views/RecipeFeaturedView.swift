//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by 廖哲澄 on 2021/11/16.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailedViewShow = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured Recipes").fontWeight(.bold).font(.largeTitle).padding(.leading).padding(.top, 40)
            GeometryReader { geo in
                TabView {
                    ForEach (0..<model.recipes.count) {
                        index in
                        if model.recipes[index].featured == true {
                            Button(action: {
                                
                                isDetailedViewShow = true
                                
                                
                            }, label: {
                                
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    VStack(spacing:0) {
                                        Image(model.recipes[index].image).resizable().clipped().aspectRatio( contentMode: .fill)
                                        Text(model.recipes[index].name).padding(5)
                                    }
                                }
                                
                                
                            }).sheet(isPresented: $isDetailedViewShow) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100).cornerRadius(10).shadow(color:.black, radius: 10, x:-5, y:5)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Country:").font(.headline)
                Text("Peru")
                Text("Preference Food:").font(.headline)
                Text("Grass")
            }.padding(.leading)
                .padding([.leading, .bottom])
            
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
