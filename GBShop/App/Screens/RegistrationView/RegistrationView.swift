//
//  RegistrationView.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

// 1. View configuration -> VC
// 2. Event handling
// Убрать в статические фабрики
import UIKit

final class RegistrationView: UIView {
    
    //MARK: Private properties
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.frame = self.bounds
        scrollView.contentSize = contentSize
        scrollView.backgroundColor = .white
        scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)))
        
        return scrollView
    }()
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()
    
    private var contentSize: CGSize {
        CGSize(width: frame.size.width, height: frame.size.height + 40)
    }
    
    private(set) lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registration"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .cyan
        return label
    }()
    
    private(set) lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    
    private(set) lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private(set) lazy var secondPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Repeat password:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var secondPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private(set) lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var genderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Male", for: .normal)
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 5
        button.tintColor = .black
        return button
    }()
    
    private(set) lazy var creditCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Credit card:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var creditCardTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private(set) lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bio:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 0.1
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private(set) lazy var signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.setTitle("Sign Up", for: .normal)
        button.layer.borderWidth = 0.2
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.backgroundColor = .lightGray
        return activityIndicator
    }()
    
    //MARK: Properties
    weak var regViewController: RegistrationViewController?
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPullDownMenu()
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    private func configureUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addRegistrationLabel()
        addEmailLabel()
        addEmailTextField()
        addUserNameLabel()
        addUserNameTextField()
        addPasswordLabel()
        addPasswordTextField()
        addSecondPasswordLabel()
        addSecondPasswordTextField()
        addGenderLabel()
        addGenderButton()
        addCreditCardLabel()
        addCreditCardTextField()
        addBioLabel()
        addBioTextView()
        addSignUpButton()
        addActivityIndicator()
    }
    
    private func setupPullDownMenu() {
        
        let genderClosure = { (action: UIAction) in
        }
        
        genderButton.menu = UIMenu(children: [
            UIAction(title: "Male", state: .on, handler:
                        genderClosure),
            UIAction(title: "Female", handler: genderClosure)
        ])
        
        genderButton.showsMenuAsPrimaryAction = true
        genderButton.changesSelectionAsPrimaryAction = true
    }
    
    
    private func addRegistrationLabel() {
        contentView.addSubview(registrationLabel)
        
        NSLayoutConstraint.activate([
            registrationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            registrationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addEmailLabel() {
        contentView.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40)
        ])
    }
    
    private func addEmailTextField() {
        contentView.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addUserNameLabel() {
        contentView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40)
        ])
    }
    
    private func addUserNameTextField() {
        contentView.addSubview(userNameTextField)
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            userNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            userNameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addPasswordLabel() {
        contentView.addSubview(passwordLabel)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addPasswordTextField() {
        contentView.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addSecondPasswordLabel() {
        contentView.addSubview(secondPasswordLabel)
        
        NSLayoutConstraint.activate([
            secondPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            secondPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addSecondPasswordTextField() {
        contentView.addSubview(secondPasswordTextField)
        
        NSLayoutConstraint.activate([
            secondPasswordTextField.topAnchor.constraint(equalTo: secondPasswordLabel.bottomAnchor,constant: 10),
            secondPasswordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            secondPasswordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            secondPasswordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addGenderLabel() {
        contentView.addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: secondPasswordTextField.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addGenderButton() {
        contentView.addSubview(genderButton)
        
        NSLayoutConstraint.activate([
            genderButton.topAnchor.constraint(equalTo: secondPasswordTextField.bottomAnchor, constant: 40),
            genderButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            genderButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            genderButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            genderButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addCreditCardLabel() {
        contentView.addSubview(creditCardLabel)
        
        NSLayoutConstraint.activate([
            creditCardLabel.topAnchor.constraint(equalTo: genderButton.bottomAnchor, constant: 10),
            creditCardLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addCreditCardTextField() {
        contentView.addSubview(creditCardTextField)
        
        NSLayoutConstraint.activate([
            creditCardTextField.topAnchor.constraint(equalTo: creditCardLabel.bottomAnchor,constant: 10),
            creditCardTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            creditCardTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addBioLabel() {
        contentView.addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor, constant: 10),
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addBioTextView() {
        contentView.addSubview(bioTextView)
        
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor,constant: 10),
            bioTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            bioTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            bioTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func addSignUpButton() {
        contentView.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 15),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150)
        ])
    }
    
    private func addActivityIndicator() {
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
    //MARK: Methods

    
    func subscribeObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    func unsubscribeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    //MARK: Obj-C methods
    @objc func signUpButtonTapped(sender: UIButton) {
        guard
            let email = emailTextField.text,
                let userName = userNameTextField.text,
                let password = passwordTextField.text,
                let secondPassword = secondPasswordTextField.text,
                let gender = genderButton.titleLabel?.text,
                let creditCard = creditCardTextField.text,
                let bio = bioTextView.text
        else { return }
                let regUser = User(id: 123,
                                   userName: userName,
                                   password: password,
                                   email: email,
                                   gender: gender,
                                   creditCard: creditCard,
                                   bio: bio)
                regViewController?.presenter?.registrationButtonTapped(user: regUser, secondPassword: secondPassword)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.layoutIfNeeded()
        }
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
}
