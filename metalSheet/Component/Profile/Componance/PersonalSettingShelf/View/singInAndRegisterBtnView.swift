//
//  singInAndRegisterBtnView.swift
//  metalSheet
//
//  Created by Schweppe on 6/12/2566 BE.
//

import SwiftUI
import WebKit
struct singInAndRegisterBtnView: View {
    @State private var isLoginSheetPresented = false
    let isiPad = UIDevice.current.userInterfaceIdiom == .pad
   
    var body: some View {
        VStack{
            Text("คุณยังไม่ได้เข้าสู่ระบบ")
                .foregroundColor(Color("lipstick"))
                .font(.system(size: isiPad ? 30 : 20))
            
            Button(action: {
                isLoginSheetPresented.toggle()
            }, label: {
                VStack (spacing: 5){
                    
                    Text("เข้าสู่ระบบ/สมัครสมาชิก")
                        .font(.system(size:isiPad ? 28 : 18, weight: .bold))
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                
                .background(Color("lipstick"))
                
                .shadow(radius: 3)
                .cornerRadius(10)
                
            })
            .sheet(isPresented: $isLoginSheetPresented){
                loginShelfView()
            }
            
            .padding(.horizontal,80)
            PolicyButtonView()
                .padding(.vertical,5)
        }
    }
}
#Preview {
   singInAndRegisterBtnView()
}


struct PolicyButtonView: View {
    let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    let urlPolicy: String = "https://schweppeweb.wixsite.com/saprachanpolicyandpr"
    let iPadWidth: CGFloat = 185

    var body: some View {
        NavigationLink(destination: WebView(url: URL(string: urlPolicy)!)) {
            HStack{
                Text("นโยบายความเป็นส่วนตัว")
                    .foregroundColor(.black)
                    .font(.system(size:isiPad ? 25 : 15))
                    .padding(.vertical,10)
                    .padding(.horizontal,15)
                   
                    .overlay(RoundedRectangle(cornerRadius:  10).stroke(Color.black,lineWidth: 1))
            }
            
           
        }
    }
}




struct WebView: View {
    let url: URL

    var body: some View {
        WebViewContainer(url: url)
            .navigationBarTitle("นโยบายความเป็นส่วนตัว", displayMode: .inline)
    }
}

struct WebViewContainer: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the view if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewContainer

        init(_ parent: WebViewContainer) {
            self.parent = parent
        }

        // Implement WKNavigationDelegate methods if needed
    }
}



