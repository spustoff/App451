//
//  HomeView.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
       
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 29, weight: .semibold))
                    
                    HStack {
                        
                        Circle()
                            .stroke(Color("primary"), lineWidth: 10)
                            .frame(width: 60, height: 60)
                        
                        Spacer()
                        
                        Text("$\(viewModel.entries.map(\.expenses).reduce(0,+))/1500")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                })
                .padding()
                .background(
                    
                    Color("bg2")
                        .overlay(
                            
                            Image("image")
                                .resizable()
                                .frame(width: 150)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        )
                        .ignoresSafeArea()
                )
                
                HStack {
                    
                    Text("Categories")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Text("\(viewModel.categories.count)")
                        .foregroundColor(.gray)
                        .font(.system(size: 19, weight: .regular))
                }
                .padding([.horizontal, .top])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Text(index)
                                .foregroundColor(viewModel.current_category == index ? .white : .black)
                                .font(.system(size: 14, weight: .medium))
                                .padding(10)
                                .padding(.horizontal, 10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.current_category == index ? Color("primary") : .white))
                                .onTapGesture {
                                    
                                    viewModel.current_category = index
                                    viewModel.fetchEntries()
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    
                    Text("History")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Text("\(viewModel.entries.count)")
                        .foregroundColor(.gray)
                        .font(.system(size: 19, weight: .regular))
                }
                .padding([.horizontal, .top])
                
                if viewModel.entries.isEmpty {
                    
                    VStack {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Text("Add a new entry")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Button(action: {
                                
                                viewModel.isAdd = true
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            })
                        })
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.white.ignoresSafeArea())
                    .padding([.horizontal, .top])
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.entries, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 4, content: {
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text(index.category ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    })
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4, content: {
                                        
                                        Text("\(index.expenses)")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 15, weight: .semibold))
                                        
                                        Text("\((index.date ?? Date()).convertDate(format: "MMM d Y"))")
                                            .foregroundColor(.white)
                                            .font(.system(size: 10, weight: .medium))
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.pink))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchEntries()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            HomeAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
