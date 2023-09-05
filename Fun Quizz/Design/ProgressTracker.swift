//
//  ProgressTracker.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//
import AVFoundation
import SwiftUI

struct ProgressTracker: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color("zomp"))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color("paleyellow"))
                .cornerRadius(10)
        }
    }
}

struct ProgressTracker_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTracker(progress: 100)
    }
}
