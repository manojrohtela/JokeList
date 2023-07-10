//
//  ContentView.swift
//  ViewbuilderWithPopup
//
//  Created by Manoj Kumar on 09/07/23.
//

import SwiftUI

struct AddData: View {
    @State private var isPresentSheet: Bool = false
    @State private var name: String = ""
    @State private var defaultString: String = ""
    var body: some View {
        VStack{
            Text(name)
            Button {
                isPresentSheet.toggle()
            } label: {
                Text("Click here")
            }
            .sheet(isPresented: $isPresentSheet,onDismiss: {
                //name = "Welcome," + name
            }) {
                AddDataViewBuilder(successBtnAction: {
                    isPresentSheet.toggle()
                    name = "Welcome," + name
                }, successBtnTitle: "Add Data") {
                    TextField("Enter your name", text: $name).onAppear{
                        name = ""
                    }
                }
                
            }
        }
    }
}


struct SearchData: View {
    @State private var isPresentSheet: Bool = false
    @State private var name: String = ""
    @State private var defaultString: String = ""
    var body: some View {
        VStack{
            Text(name)
            Button {
                isPresentSheet.toggle()
            } label: {
                Text("Click here")
            }
            .sheet(isPresented: $isPresentSheet,onDismiss: {
                //name = "Welcome," + name
            }) {
                AddDataViewBuilder(successBtnAction: {
                    isPresentSheet.toggle()
                    name = "Welcome," + name
                }, successBtnTitle: "Add Data") {
                    TextField("Enter your name", text: $name).onAppear{
                        name = ""
                    }
                }
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddData()
    }
}


struct BaseViewBuilder<Content>: View where Content: View{
    let content : Content
    @Environment(\.dismiss) var dismiss
    
    
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View{
        VStack {
            HStack{
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("sdfgdsfdsf")
                }
            }
            Spacer()
            content
            
        }
        .frame(width: 398,height: 395)
        .background(.red)
        
    }
    
}


struct AddDataViewBuilder<Content>: View where Content: View{
    let content : Content
    let successBtnTitle: String
    let cancelBtnTitle: String
    let successBtnAction : ()->Void
    @Environment(\.dismiss) var dismiss
    
    
    
    init(successBtnAction:@escaping ()->Void,successBtnTitle:String,cancelBtnTitle:String = "Cancel", @ViewBuilder content: () -> Content) {
        self.content = content()
        self.successBtnAction = successBtnAction
        self.successBtnTitle = successBtnTitle
        self.cancelBtnTitle = cancelBtnTitle
    }

    var body: some View{
        VStack {
            BaseViewBuilder {
                content
                VStack{
                    Spacer()
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Text(cancelBtnTitle)
                        }
                        Spacer()
                        Button {
                            successBtnAction()
                        } label: {
                            Text(successBtnTitle)
                        }
                        
                        
                    }
                }
            }
            
        }
        .frame(width: 398,height: 395)
        .background(.red)
        
    }
    
}
