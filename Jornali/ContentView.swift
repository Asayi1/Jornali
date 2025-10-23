//
//  ContentView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 24/04/1447 AH.
//
/*

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "Empty")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
           
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
*/
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // المساحة العلوية اللي فيها الزر
            HStack {
                // الزر المركب على اليسار
                HStack(spacing: 0) {
                    Button(action: {
                        print("تصنيف")
                    }) {
                        Text("تصنيف")
                            .frame(width: 60, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.blue)
                    }

                    Button(action: {
                        print("إضافة")
                    }) {
                        Text("إضافة")
                            .frame(width: 60, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Spacer() // يدفع الزر لليسار
            }
            .padding()

            Spacer()

            Text("محتوى الصفحة")
                .font(.title)

            Spacer()
        }
    }
}
#Preview {
    ContentView()
}
