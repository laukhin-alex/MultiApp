//
//  LeaderboardView.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var tries: GuessNumber

    var body: some View {
        VStack {
            List{
                ForEach(self.tries.finalCount, id:\.self){ text in
                    Text(text)
                }
            }
        }
    }
}
struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
