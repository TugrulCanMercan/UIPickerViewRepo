//
//  ButtonViewController.swift
//  UIPickerView
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 6.09.2022.
//

import UIKit
import SwiftUI

class ButtonViewController: UIViewController {

    let verticalStack: UIStackView = {
        let stck = UIStackView()
        stck.backgroundColor = .yellow
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.distribution = .fill
        stck.axis = .vertical
        stck.alignment = .trailing
        return stck
    }()
    
    let horizontalStack: UIStackView = {
        let stck = UIStackView()
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.distribution = .fill
        stck.axis = .horizontal
        return stck
    }()
    
    let verticalTextFieldStack: UIStackView = {
        let stck = UIStackView()
        stck.backgroundColor = .systemPink
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.distribution = .fill
        stck.axis = .vertical
        stck.alignment = .trailing
        return stck
    }()
    let verticalRightStack: UIStackView = {
        let stck = UIStackView()
        stck.backgroundColor = .systemPink
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.distribution = .fill
        stck.axis = .vertical
        stck.alignment = .trailing
        return stck
    }()
    
    lazy var textfield: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .yellow
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let rightButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "person"), for: .normal)
        return btn
    }()
    let firstContainer: UIView = {
        let con = UIView()
        con.backgroundColor = .red
        con.translatesAutoresizingMaskIntoConstraints = false
        return con
    }()
    
    let seperator: UIView = {
        let con = UIView()
        con.backgroundColor = .red
        con.translatesAutoresizingMaskIntoConstraints = false
        return con
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blueContainer = UIView()
        blueContainer.translatesAutoresizingMaskIntoConstraints = false
        blueContainer.backgroundColor = .blue
        
        let yellowContainer = UIView()
        yellowContainer.translatesAutoresizingMaskIntoConstraints = false
        yellowContainer.backgroundColor = .yellow
        
        let container = UIView()
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(container)
//
//        container.widthAndHeight(width: 100, height: 100)
//            .contentAlginment(content: view, alignment: .centerAlignment)
//            .addSubview(yellowContainer)
//
//
//        yellowContainer.widthAndHeight(width: 50, height: 50)
//            .contentAlginment(content: container, alignment: .bottomAlignment)
        
        
        let HStackDeneme: UIStackView = {
            let hsctk = UIStackView()
            hsctk.distribution = .fill
            
            hsctk.axis = .horizontal
            hsctk.translatesAutoresizingMaskIntoConstraints = false
            hsctk.backgroundColor = .red
            return hsctk
        }()
        
        let VStackDeneme: UIStackView = {
            let hsctk = UIStackView()
            hsctk.distribution = .fill
            hsctk.axis = .vertical
            hsctk.translatesAutoresizingMaskIntoConstraints = false
            hsctk.backgroundColor = .green
            return hsctk
        }()
        
        let VStackDeneme2: UIStackView = {
            let hsctk = UIStackView()
            hsctk.distribution = .fill
            hsctk.axis = .vertical
            hsctk.translatesAutoresizingMaskIntoConstraints = false
            hsctk.backgroundColor = .purple
            return hsctk
        }()
        
        lazy var button : UIButton = {
            let btn = UIButton()
            btn.addTarget(self, action: #selector(action), for: .touchUpInside)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .red
            return btn
        }()
        view.addSubview(button)
        button.widthAndHeight(width: 50, height: 50)
            .contentAlginment(content: view, alignment: .centerAlignment)
        
//        view.addSubview(HStackDeneme)
//        HStackDeneme.addArrangedSubview(container)
//        HStackDeneme.addArrangedSubview(VStackDeneme)
//
//
////        VStackDeneme.addArrangedSubview(yellowContainer)
////        yellowContainer.addSubview(VStackDeneme2)
////        VStackDeneme2.addArrangedSubview(blueContainer)
//        HStackDeneme
//            .widthAndHeight(width: 270 , height: 170)
//        container
//            .widthAndHeight(width: 40, height: 40)
////        yellowContainer.widthAndHeight(width: 15, height: 15)
////        VStackDeneme2.widthAnchor.constraint(equalTo: yellowContainer.widthAnchor).isActive = true
////        VStackDeneme2.heightAnchor.constraint(lessThanOrEqualTo: yellowContainer.heightAnchor,constant: 1).isActive = true
////        VStackDeneme2.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
////        VStackDeneme2.contentAlginment(content: yellowContainer, alignment: .centerAlignment)
////        blueContainer.widthAndHeight(width: 50, height: 250)
//        VStackDeneme.heightAnchor.constraint(lessThanOrEqualTo: HStackDeneme.heightAnchor).isActive = true
//        VStackDeneme.widthAnchor.constraint(equalToConstant: 10).isActive = true
//        VStackDeneme.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        
//        container
//            .equalWidth(content: view)
//            .widthAndHeight(height: 70)
//            .vStack(blueContainer.widthAndHeight(width: 50, height: 170)
//                .hStack(yellowContainer.fill(content: yellowContainer.widthAndHeight(width: 100, height: 100))),distribution: .fillEqually)
//            .contentAlginment(content: container, alignment: .bottomTrailingAlignment,padding: UIEdgeInsets(top: -8, left: 8, bottom: 8, right: 8))
            
        
        
//        let containerDenek = UIView()
//        containerDenek.backgroundColor = .red
//        containerDenek.translatesAutoresizingMaskIntoConstraints = false
//        let innerContainer = UIView()
//        innerContainer.backgroundColor = .blue
//        innerContainer.translatesAutoresizingMaskIntoConstraints = false
//        let innerContainerYellow = UIView()
//        innerContainerYellow.backgroundColor = .yellow
//        innerContainerYellow.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(containerDenek)
//        containerDenek.widthAndHeight(width: 250, height: 250)
//
//        containerDenek.hStack(innerContainer.widthAndHeight(width: 50, height: 50),innerContainerYellow.widthAndHeight(width: 70, height: 70))
//            .fill(content: containerDenek)
//            .contentAlginment(content: containerDenek, alignment: .topTrailingAlignment,padding: .init(top: 8, left: 0, bottom: 8, right: 8))
        


    }
    func deneme() {
        let container = UIView()
        container.backgroundColor = .red

        view.addSubview(verticalStack)
        verticalStack.addArrangedSubview(horizontalStack)
        horizontalStack.addArrangedSubview(verticalTextFieldStack)
        horizontalStack.addArrangedSubview(verticalRightStack)
        verticalTextFieldStack.addArrangedSubview(textfield)
        verticalStack.addArrangedSubview(seperator)
        verticalRightStack.addArrangedSubview(rightButton)

        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            horizontalStack.widthAnchor.constraint(equalTo: verticalStack.widthAnchor),
            verticalRightStack.widthAnchor.constraint(equalToConstant: 50),
            firstContainer.widthAnchor.constraint(equalToConstant: 50),
            firstContainer.heightAnchor.constraint(equalToConstant: 50),
            verticalTextFieldStack.heightAnchor.constraint(equalToConstant: 50),
            textfield.widthAnchor.constraint(equalTo: verticalTextFieldStack.widthAnchor),
            seperator.widthAnchor.constraint(equalTo: verticalStack.widthAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    @objc func action() {
        share()
    }

    func share() {
        let base64 = "JVBERi0xLjcKCjEgMCBvYmoKICA8PCA+PgplbmRvYmoKCjIgMCBvYmoKICA8PCAvTGVuZ3RoIDMgMCBSID4+CnN0cmVhbQovRGV2aWNlUkdCIENTCi9EZXZpY2VSR0IgY3MKcQoxLjAwMDAwMCAwLjAwMDAwMCAtMC4wMDAwMDAgMS4wMDAwMDAgMjEuMDAwMDAwIDcuODA0NzQ5IGNtCjAuNjU5ODkxIDAuNjUxNjExIDAuNjUxNjExIHNjbgowLjcwNzEwNyAxNC45MDIzNTggbQowLjMxNjU4MyAxNS4yOTI4ODMgLTAuMzE2NTgzIDE1LjI5Mjg4MyAtMC43MDcxMDcgMTQuOTAyMzU4IGMKLTEuMDk3NjMxIDE0LjUxMTgzNCAtMS4wOTc2MzEgMTMuODc4NjY5IC0wLjcwNzEwNyAxMy40ODgxNDUgYwowLjcwNzEwNyAxNC45MDIzNTggbApoCjYuMDAwMDAwIDguMTk1MjUxIG0KNi43MDcxMDcgNy40ODgxNDUgbAo3LjA5NzYzMSA3Ljg3ODY2OSA3LjA5NzYzMSA4LjUxMTgzNCA2LjcwNzEwNyA4LjkwMjM1OCBjCjYuMDAwMDAwIDguMTk1MjUxIGwKaAotMC43MDcxMDcgMi45MDIzNTggbQotMS4wOTc2MzEgMi41MTE4MzQgLTEuMDk3NjMxIDEuODc4NjY5IC0wLjcwNzEwNyAxLjQ4ODE0NSBjCi0wLjMxNjU4MyAxLjA5NzYyMCAwLjMxNjU4MyAxLjA5NzYyMCAwLjcwNzEwNyAxLjQ4ODE0NSBjCi0wLjcwNzEwNyAyLjkwMjM1OCBsCmgKLTAuNzA3MTA3IDEzLjQ4ODE0NSBtCjUuMjkyODkzIDcuNDg4MTQ1IGwKNi43MDcxMDcgOC45MDIzNTggbAowLjcwNzEwNyAxNC45MDIzNTggbAotMC43MDcxMDcgMTMuNDg4MTQ1IGwKaAo1LjI5Mjg5MyA4LjkwMjM1OCBtCi0wLjcwNzEwNyAyLjkwMjM1OCBsCjAuNzA3MTA3IDEuNDg4MTQ1IGwKNi43MDcxMDcgNy40ODgxNDUgbAo1LjI5Mjg5MyA4LjkwMjM1OCBsCmgKZgpuClEKCmVuZHN0cmVhbQplbmRvYmoKCjMgMCBvYmoKICA3ODEKZW5kb2JqCgo0IDAgb2JqCiAgPDwgL01lZGlhQm94IFsgMC4wMDAwMDAgMC4wMDAwMDAgMzIuMDAwMDAwIDMyLjAwMDAwMCBdCiAgICAgL1Jlc291cmNlcyAxIDAgUgogICAgIC9Db250ZW50cyAyIDAgUgogICAgIC9QYXJlbnQgNSAwIFIKICAgICAvVHlwZSAvUGFnZQogID4+CmVuZG9iagoKNSAwIG9iagogIDw8IC9LaWRzIFsgNCAwIFIgXQogICAgIC9Db3VudCAxCiAgICAgL1R5cGUgL1BhZ2VzCiAgPj4KZW5kb2JqCgo2IDAgb2JqCiAgPDwgL1R5cGUgL0NhdGFsb2cKICAgICAvUGFnZXMgNSAwIFIKICA+PgplbmRvYmoKCnhyZWYKMCA3CjAwMDAwMDAwMDAgNjU1MzUgZiAKMDAwMDAwMDAxMCAwMDAwMCBuIAowMDAwMDAwMDM0IDAwMDAwIG4gCjAwMDAwMDA4NzEgMDAwMDAgbiAKMDAwMDAwMDg5MyAwMDAwMCBuIAowMDAwMDAxMDUwIDAwMDAwIG4gCjAwMDAwMDExMjQgMDAwMDAgbiAKdHJhaWxlcgo8PCAvSUQgWyAoc29tZSkgKGlkKSBdCiAgIC9Sb290IDYgMCBSCiAgIC9TaXplIDcKPj4Kc3RhcnR4cmVmCjExODMKJSVFT0Y="
        let data = Data(base64Encoded: base64)
        let documentsURL = try!
            FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)

        let savedURL = documentsURL.appendingPathComponent("deneme.pdf")
        do {

            try data?.write(to: savedURL)
        } catch {
            print ("file error: \(error)")
        }
        let activityViewController = UIActivityViewController(activityItems: [savedURL], applicationActivities: nil)
        present(activityViewController, animated: true)
    }

}



struct ButtonViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container1()
    }
}

struct Container1: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ButtonViewController {
        return ButtonViewController()
    }
    
    func updateUIViewController(_ uiViewController: ButtonViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = ButtonViewController
    
    
    
}
