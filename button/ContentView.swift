//
//  ContentView.swift
//  button
//
//  Created by Andreas Pelczer on 24.11.23.
//
import SwiftUI

struct ContentView: View {
    @State private var lottoZahlen: [Int] = []

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Spacer()

            Button(action: {
                self.lottoZahlen = self.generatelottoZahlen()
            }) {
                Text("Erzeuge lottoZahlen")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            if !lottoZahlen.isEmpty {
                Text("Lotto Zahlen: \(lottoZahlen.map { String($0) }.joined(separator: ", "))")
                    .padding()
            }
        }
        .padding()
    }

    func generatelottoZahlen() -> [Int] {
        var lottoZahlen = Set<Int>()

        while lottoZahlen.count < 6 {
            let zufallszahl = Int.random(in: 1...49)
            lottoZahlen.insert(zufallszahl)
        }

        return lottoZahlen.sorted()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
