import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    @IBOutlet weak var decodeButton: UIButton!
    
    @IBOutlet weak var caesarBuuton: UIButton!
    @IBOutlet weak var AlphaButton: UIButton!
    @IBOutlet weak var vigenereButton: UIButton!
    @IBOutlet weak var atbashbutton: UIButton!
    @IBOutlet weak var encodeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        buttons border radius 
        decodeButton.layer.cornerRadius = 10
        encodeButton.layer.cornerRadius = 10
        vigenereButton.layer.cornerRadius = 10
        AlphaButton.layer.cornerRadius = 10
        atbashbutton.layer.cornerRadius = 10
        caesarBuuton.layer.cornerRadius = 10
        
//        button Animations!
        UIView.animate(withDuration: 0.6,animations: {
            self.encodeButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.encodeButton.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 0.6,animations: {
            self.decodeButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.decodeButton.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 0.6,animations: {
            self.atbashbutton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.atbashbutton.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 0.6,animations: {
            self.vigenereButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.vigenereButton.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 0.6,animations: {
            self.AlphaButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.AlphaButton.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 0.6,animations: {
            self.caesarBuuton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.caesarBuuton.transform = CGAffineTransform.identity
            }
        })
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: {
            var frame = self.output.frame
            frame.origin.x = frame.origin.x + 50
            frame.origin.y = frame.origin.y + 50
            self.output.frame = frame
            
            self.output.alpha = 1
            
        }, completion: { finished in
            print("Animation completed")
        })
        
        
    }
    
    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }
    
    
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
    }

    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decoded = cipher.decode(plaintext, secret: secretText) {
            output.text = decoded
        } else {
            output.text = "Error decoding"
        }
    }
    
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
}

