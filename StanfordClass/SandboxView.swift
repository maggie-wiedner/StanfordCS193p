//
//  SandboxView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/14/24.
//

import SwiftUI

struct SandboxView: View {
    @State var buttonStatus = true
        
    var body: some View {
            
    VStack {
        Spacer()
        if buttonStatus == true {buttonTrue}
        else {buttonFalse}
        Spacer()
        Button1}}
            
            
    var buttonTrue: some View {
        ZStack {
            Circle()
                .fill(.pink)
                .frame(width: 100, height: 100)
            Text("🎉true")
                .font(.title)
                .imageScale(.large)
                .foregroundColor(.white)}}
        
        
    var buttonFalse: some View {
        ZStack {
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
            Text("🥳false")
                .font(.title)
                .imageScale(.large)
                .foregroundColor(.white)}}
    
    
    var Button1: some View {
        Button(
            action: {
                self.buttonStatus.toggle()
                print(buttonStatus)},
            label: {Text("Button")})}
}


#Preview {
    SandboxView()
}
