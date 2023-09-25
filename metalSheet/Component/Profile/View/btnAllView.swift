//
//  btnAllView.swift
//  metalSheet
//
//  Created by Schweppe on 7/9/2566 BE.
//

import SwiftUI

struct btnAllView: View {
    var body: some View {
        
        VStack(spacing: 15) {
            btnView(image: "userLogo", name: "จัดการข้อมูลส่วนตัว")
            btnView(image: "busLogo", name: "จัดการที่อยู่จัดส่ง")
            btnView(image: "passwordLogo", name: "เปลี่ยนรหัสผ่าน")
            btnView(image: "logoutLogo", name: "ออกจากระบบ")
           
        }
    }
}

struct btnAllView_Previews: PreviewProvider {
    static var previews: some View {
        btnAllView()
    }
}
