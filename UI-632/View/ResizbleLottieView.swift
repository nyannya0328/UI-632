//
//  ResizbleLottieView.swift
//  UI-632
//
//  Created by nyannyan0328 on 2022/08/05.
//

import SwiftUI
import Lottie

struct ResizbleLottieView: UIViewRepresentable {
    var lottieView : AnimationView
    var color : SwiftUI.Color = .black
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        setUp(to: view)
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView{
            
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            let fillKeyPath = AnimationKeypath(keys: ["**","Fill 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
            
            let strokeKeyPath = AnimationKeypath(keys: ["**","Stroke 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
            
           
        }
        
    }
    
    func setUp(to : UIView){
        
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        
        let contains = [
        
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor),
        
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(contains)
        
    }
}

