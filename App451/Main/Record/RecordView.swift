//
//  RecordView.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct RecordView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    Text("Record")
                        .foregroundColor(.white)
                        .font(.system(size: 29, weight: .semibold))
                    
                    Text("Categories")
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .semibold))
                    
                    HStack {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                        
                            VStack(alignment: .center, spacing: 9, content: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("\(viewModel.entries.filter{$0.category == index}.count)")
                            })
                            .padding()
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                        
                        Spacer()
                    }
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
                
                Button(action: {
                    
                    viewModel.isChart = true
                    
                }, label: {
                    
                    HStack {
                        
                        Image("eurusd")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                        
                        Text("EUR/USD")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding()
                })
                
                HStack {
                    
                    Text("All")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .regular))
                    })
                }
                .padding([.horizontal])
                
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
        .sheet(isPresented: $viewModel.isChart, content: {
            
            RecordChart()
        })
    }
}

#Preview {
    RecordView()
}
