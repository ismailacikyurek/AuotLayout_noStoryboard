//
//  profileView.swift
//  noStroyboard
//
//  Created by İSMAİL AÇIKYÜREK on 17.05.2022.
//

import UIKit
import PureLayout

class profileView: UIView {

     var shouldSetupContraints = true
    
    var bannerView : UIImageView! //imageView cinsinden banner ekliyoruz.
    var profileView : UIImageView! //imageView cinsinden profil ekliyoruz.
    var segmentedControl : UISegmentedControl!
    
    let screenSize = UIScreen.main.bounds
    
    
    override init(frame: CGRect) {//widgetlerin boyutlarını ayarlıyoruz
        super.init(frame: frame)
        
        bannerView = UIImageView(frame: CGRect.zero) //dikdörtgen oluşturma
        bannerView.backgroundColor = UIColor.red //arkaplanı kırmızı
        bannerView.autoSetDimension(.height, toSize: screenSize.width/3) //yüksekliği genişliğin 1/3 boyutunda olucak
        self.addSubview(bannerView)
        
        
        
        profileView = UIImageView(frame: CGRect.zero)
        profileView.backgroundColor = UIColor.gray //rengi gree
        profileView.layer.borderColor = UIColor.white.cgColor //çerceve beyaz
        profileView.layer.borderWidth = 1.0 //çerçeve kalınlığı
        profileView.layer.cornerRadius = 15.0 //köşleri yuvarlaştırma oranı
        
        profileView.autoSetDimension(.width, toSize: 124.0) //profilViewin genişliği
        profileView.autoSetDimension(.height, toSize: 124.0)//profilViewin yüksekliği
        self.addSubview(profileView)
        
        segmentedControl = UISegmentedControl(items: ["twetts","Media","Likes"]) //3 sekme ekliyoruz
        segmentedControl.selectedSegmentTintColor = UIColor.red //seçilen indeks rengi
        segmentedControl.backgroundColor = .yellow //arkaplan
        self.addSubview(segmentedControl)
    }
    
    required init?(aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() { //ekranda nerede olacağını belirliyoruz
        if (shouldSetupContraints){
            let edgesInset : CGFloat = 10.0
            let centerOffset : CGFloat = 62.0
            
            bannerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom) //banneri en üste sabitledik.
            
            profileView.autoPinEdge(toSuperviewEdge: .left, withInset: edgesInset)//soldana 10.0 boşluk
            profileView.autoPinEdge(.bottom, to: .bottom, of: bannerView, withOffset : centerOffset) //profileViewin alt noktatsı ile ,bannerviewin alt noktasının mesafesi 62.. böylelikle profileView tam ortadan yerleşmiş oldu.
            
            segmentedControl.autoPinEdge(toSuperviewEdge: .bottom, withInset: edgesInset) //alttan 10 px
            segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: edgesInset)//soldan 10 px
            segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: edgesInset)//sağdan 10 px
            
            shouldSetupContraints = false
        }
        super.updateConstraints()
    }
    
}
