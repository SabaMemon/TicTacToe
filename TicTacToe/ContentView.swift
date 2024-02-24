//
//  ContentView.swift
//  TicTacToe
//
//  Created by Saba Memon on 2020-02-04.
//  Copyright © 2020 Saba Memon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var board = [["","",""],["","",""],["","",""]]
    @State private var player = true //true: O, false: X
    @State private var winnerFound = false
    @State var winner = ""
    
    var body: some View {
        NavigationView{
//            VStack(alignment: .leading, spacing: 20){
//                Text("Hello, World!").background(Color.yellow)
//                Text("What should be the prompt?").background(Color.green)
//
//                HStack(alignment: .bottom, spacing: 50){
//                    Text("10").background(Color.yellow)
//                    Text("20").background(Color.green)
//                }
//            }
        
            VStack{
                ForEach(0 ..< 3){ row in
                    HStack{
                        ForEach(0 ..< 3){ col in
                            Button(action: {
                                print("Button clicked")
                                self.play(r: row, c: col) //passing in parameters
                                self.checkWinner()
                            }){
                                //appearance
                                Text(self.board[row][col]).frame(minWidth: 80, minHeight: 80).background(Color.blue).foregroundColor(Color.white).font(.system(size: 40)).padding(20)
                            }
                                .alert(isPresented: self.$winnerFound){
                                    Alert(title: Text("Result"),
                                          message: Text("\(self.winner) wins"),
                                          dismissButton:
                                        .default(Text("Play again?")){
                                            self.resetGame()
                                        })
                            }//alert ends
                            //Button ends
                        }//ForEach ends
                    }//HStack ends
                }//ForEach row ends
                HStack(spacing: 20){
                    Text("Whose turn?")
                    if self.player{
                        Text("O")
                    }else{
                    Text("X")
                    }
                }//inner HStack ends (previously Section)
            } //VStack ends
        }.navigationViewStyle(StackNavigationViewStyle())//NavigationView ends
    }//body ends

    func resetGame(){
        self.board = [["","",""],["","",""],["","",""]]
        self.player = true //true: O, false: X
        self.winnerFound = false
    }
    
    
    func play(r: Int, c: Int){ //method called when button called (as seen in Button action)
        if self.board[r][c] == ""{
            //toggle the button text
            if self.player{
                // player O
                self.board[r][c] = "O"
            }else{
                // player X
                self.board[r][c] = "X"
            }
            self.player = !self.player
        }
    }
    
    func checkWinner(){
        //check for winner
        
        //check for tie
        for row in 0..<3{
            for col in 0..<3{
                if self.board[row][col] != ""{
                    //do smth
                }
            }
        }
        
        //row
        for row in 0..<3{
            if ((self.board[row][0] != "") &&
                (self.board[row][0] ==
                self.board[row][1]) &&
                (self.board[row][0] ==
                self.board[row][2])){
                self.winner = self.board[row][0]
                winnerFound = true
                return
            }
        }
        
        //col
        for col in 0..<3{
            if ((self.board[0][col] != "") &&
                (self.board[0][col] ==
                self.board[1][col]) &&
                (self.board[0][col] ==
                self.board[2][col])){
                self.winner = self.board[0][col]
                winnerFound = true
                return
            }
        }
        
        //diag
            if ((self.board[0][0] != "") &&
                (self.board[0][0] ==
                self.board[1][1]) &&
                (self.board[0][0] ==
                self.board[2][2])){
                self.winner = self.board[0][0]
                winnerFound = true
                return
            }
            if ((self.board[0][2] != "") &&
                (self.board[0][2] ==
                self.board[1][1]) &&
                (self.board[0][2] ==
                self.board[2][0])){
                self.winner = self.board[0][2]
                winnerFound = true
                return
            }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        Group{
            ContentView().environment(\.colorScheme, .dark).previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max")).previewDisplayName("iPhone 11 Pro Max")
            ContentView().environment(\.colorScheme, .light).previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus")).previewDisplayName("iPhone 8 Plus")
            ContentView().environment(\.locale, .init(identifier: "fr")).environment(\.colorScheme, .light).previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max")).previewDisplayName("iPhone 11 Pro Max")
            }
        }
    }
}
