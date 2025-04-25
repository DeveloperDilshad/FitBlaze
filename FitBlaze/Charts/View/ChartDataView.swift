//
//  ChartDataView.swift
//  FitBlaze
//
//  Created by Dilshad P on 25/04/25.
//

import SwiftUI

struct ChartDataView: View {
    
    @State var average: Int = 0
    @State var total:Int = 0
    
    var body: some View {
        HStack {
            
            VStack{
                
                Text("Average")
                    .font(.title2)
                
                Text("\(average)")
                    .font(.title3)
            }
            .frame(width: 90)
            .foregroundStyle(.black)
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            VStack{
                
                Text("Total")
                    .font(.title2)
                
                Text("\(total)")
                    .font(.title3)
            }
            .frame(width: 90)
            .foregroundStyle(.black)
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ChartDataView(average: 2346,total: 77865)
}
