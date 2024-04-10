//
//  HomeAdd.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct HomeAdd: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add an Entry")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 10, weight: .medium))
                                .frame(width: 23, height: 23)
                                .background(Circle().fill(.gray.opacity(0.2)))
                        })
                        
                        Spacer()
                    }
                }
                .padding([.horizontal, .top])
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        .padding()
                        .frame(height: 53)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("Expenses")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.expenses.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.expenses)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .frame(height: 53)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            DatePicker(selection: $viewModel.date, displayedComponents: .date, label: {})
                                .labelsHidden()
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 53)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        Menu {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.category = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index)
                                        
                                        Spacer()
                                        
                                        if viewModel.category == index {
                                            
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                Text(viewModel.category.isEmpty ? "Select Category" : viewModel.category)
                                    .foregroundColor(viewModel.category.isEmpty ? .gray : .black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10, weight: .regular))
                            }
                            .padding()
                            .frame(height: 53)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addEntry()
                    viewModel.fetchEntries()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.name = ""
                    viewModel.expenses = ""
                    viewModel.date = Date()
                    viewModel.category = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.expenses.isEmpty || viewModel.category.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.expenses.isEmpty || viewModel.category.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    HomeAdd(viewModel: HomeViewModel())
}
