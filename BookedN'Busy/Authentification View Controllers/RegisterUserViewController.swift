import Firebase
import UIKit

//This class is used to register new user account within Firebase Authentification and Realtime Database
class RegisterUserViewController: UIViewController {

    // Outlets for text fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    // Outlets for restriction checking
    @IBOutlet weak var validityLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var passwordGuidlines: UILabel!
    
    // Validity initializer (Refer to Extension -> Password Rules)
    var validityType: String.ValidityType = .email

    // Reference the database
    var ref: DatabaseReference!
    
    // Override Method //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.returnButton(first: firstNameTextField, second: lastNameTextField,
                          third: emailTextField, fourth: passwordTextField, fifth: repeatPasswordTextField)
        setSignUpButton(enabled: true)
        // Labels appear and disappear when fields are filled in right or wrong
        setLabelVisibility(label: passwordGuidlines, visible: false)
        setLabelVisibility(label: validityLabel, visible: false)
        ref =  Database.database().reference()
    }
    
    // Sign Up Button Functions //
    // Method is used when sign up button is tapped
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        // If the password and confirm password fields are correct then good to go, user is created
        if passwordTextField.text != repeatPasswordTextField.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
                if let error = error {
                        print(error.localizedDescription)
                    
                }
                if let user = user {
                    // Changes the Firebase display name to the users first name and last name for future use
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.firstNameTextField.text! + " " + self.lastNameTextField.text!
                    changeRequest?.commitChanges(completion: nil)
                    // Adds the information to the users tree in the database
                    let userInfo: [String : Any] = ["uid" : user.user.uid,
                                                    "firstName": self.firstNameTextField.text!,
                                                    "lastName": self.lastNameTextField.text!,
                                                    "email":self.emailTextField.text!
                                                    ]
                    self.ref.child("users").child(user.user.uid).setValue(userInfo)
                    // Once user is created bring back to the sign in screen to test credentials were properly saved
                    let alertController = UIAlertController(title: "Account Created!", message: "Sign In" , preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Go to Sign In", style: .default, handler: {action in
                        
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController")
                        self.present(vc, animated: true, completion: nil)
                        
                    }))
                    self.present (alertController, animated: true, completion: nil ) 
                }
                    
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }


    // Cancel Registration Page //
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel Button Tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
            // Dismiss Keyboard //
    @IBAction func dismissKeyboard(_ sender: Any) {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
    
    // Refer to extensions folder -> Register Extension and Password Rules
    // Email Textfield Action [Editing Ended] //
    @IBAction func emailField(_ sender: Any) {
        handleTextChange(field: emailTextField)
    }
    // Password Textfield Action [Editing Ended] //
    @IBAction func passwordField(_ sender: Any){
        validityType = .password
        handleTextChange(field: passwordTextField)
    }
    // Repeat Password TextField Action
    @IBAction func repeatPasswordField(_ sender: Any) {
        if repeatPasswordTextField.text != passwordTextField.text {
            setLabelVisibility(label: validityLabel, visible: true)
            validityLabel.text = "Passwords do not match."
            }
        else {
            validityLabel.text = "Password Match"
        }
    }
}



