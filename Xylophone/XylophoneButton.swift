import Foundation
import UIKit


@IBDesignable
final class XiloButton: UIButton {

   
    @IBInspectable var leftHandImage: UIImage? {
        didSet {
            leftHandImage = leftHandImage?.withRenderingMode(.alwaysOriginal)
        }
    }
    @IBInspectable var rightHandImage: UIImage? {
        didSet {
            rightHandImage = rightHandImage?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
         addGradient(self)
    }
    
    override func layoutSubviews() {
        setup()
        
    }
    
    func setup() {
        
        for subUIView in self.subviews as [UIView] {
            subUIView.removeFromSuperview()
        }
        
        let frameWidth = self.frame.width
        let frameHeight = self.frame.height
        // circle with the same hight and width
        let buttonHight = frameHeight * 0.4
        let buttonWidht = buttonHight
        
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
    
      
        if leftHandImage != nil {
            let innerImageView : UIImageView = UIImageView(image: leftHandImage)
            let xPosition = buttonWidht
            let yPosition = frameHeight * 0.30
            innerImageView.frame = CGRect(x: xPosition,
                                          y: yPosition,
                                          width: buttonWidht,
                                          height: buttonHight)
            self.addSubview(innerImageView)
            
        }
        if rightHandImage != nil {
            let innerImageView : UIImageView = UIImageView(image: rightHandImage)
            let xPosition = frameWidth - buttonWidht * 2
            let yPosition = frameHeight * 0.30
            innerImageView.frame = CGRect(x: xPosition,
                                          y: yPosition,
                                          width: buttonWidht,
                                          height: buttonHight)
            self.addSubview(innerImageView)
            
        }
        
    }
    
    func isRotated() -> Bool {
        return (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft ||
                UIDevice.current.orientation == UIDeviceOrientation.landscapeRight )
    }

    func shakeMovement() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.05
        animation.values = [-5.0, 5.0, -5.0, 5.0, -5.0, 5.0, -10.0, 10.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func addGradient(_ _button: UIButton?) {
        
        // Add Border
        let layer: CALayer? = _button?.layer
        layer?.cornerRadius = 8.0
        layer?.masksToBounds = false
        layer?.borderWidth = 1.0
        layer?.borderColor = UIColor(white: 0.5, alpha: 0.2).cgColor
        
        // Add Shine
        let shineLayer = CAGradientLayer()
        shineLayer.frame = layer?.bounds ?? CGRect.zero
        shineLayer.colors = [UIColor(white: 1.0, alpha: 0.4).cgColor,
                             UIColor(white: 1.0, alpha: 0.2).cgColor,
                             UIColor(white: 0.75, alpha: 0.2).cgColor,
                             UIColor(white: 0.4, alpha: 0.2).cgColor,
                             UIColor(white: 1.0, alpha: 0.4).cgColor]
        
        shineLayer.locations = [NSNumber(value: 0.0),
                                NSNumber(value: 0.5),
                                NSNumber(value: 0.5),
                                NSNumber(value: 1.0),
                                NSNumber(value: 1.0)]
        
        layer?.addSublayer(shineLayer)
    
    }

}
