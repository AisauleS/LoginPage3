//
//  ViewController.swift
//  LoginPage3
//
//  Created by Aisaule Sibatova on 24.02.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Login"
        return label
    }()
    
    lazy var accountNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.textAlignment = .left
        textField.placeholder = "keanureeves01"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.font = .systemFont(ofSize: 12)
        textField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        textField.setUpImage(imageName: "checkmark3", on: .right)
        textField.setUpImage(imageName: "person", on: .left)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.font = .systemFont(ofSize: 12)
        textField.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        textField.setUpImage(imageName: "lock", on: .left)
        return textField
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 121/255.0, green: 134/255.0, blue: 203/255.0, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 10
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        return button
    }()
    
    lazy var orLoginWithLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.text = "or connect with"
        label.drawLineOnBothSides(labelWidth: 180, color: .lightGray)
        return label
    }()
    
    lazy var dontHaveAcountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .right
        label.textColor = .lightGray
        label.text = "Dont have account?"
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.setTitleColor(UIColor(red: 106/255.0, green: 90/255.0, blue: 205/255.0, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 66/255.0, green: 165/255.0, blue: 245/255.0, alpha: 1)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 10
        let iconImage = UIImage(named: "facebookicon")?.withRenderingMode(.alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 55)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var twitterButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 92/255.0, green: 107/255.0, blue: 192/255.0, alpha: 1)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 10
        let iconImage = UIImage(named: "twitter")?.withRenderingMode(.alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 55)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(accountNameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(logInButton)
        stackView.addArrangedSubview(forgotPasswordButton)
        stackView.setCustomSpacing(42, after: passwordTextField)
        return stackView
    }()
    
    lazy var socialButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(twitterButton)
        return stackView
    }()

    lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -42
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(dontHaveAcountLabel)
        stackView.addArrangedSubview(signUpButton)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    private func setLayout() {
           
           [imageView, loginLabel, loginStackView, orLoginWithLabel, socialButtonsStackView, signUpStackView].forEach {
               view.addSubview($0)
           }

           imageView.snp.makeConstraints  { make in
               make.centerX.equalToSuperview()
           }
           
           loginLabel.snp.makeConstraints {make in
               make.centerX.equalToSuperview()
               make.top.equalToSuperview().offset(130)
           }
           
           loginStackView.snp.makeConstraints {make in
               make.top.equalTo(loginLabel.snp.bottom).offset(58)
               make.leading.trailing.equalToSuperview().inset(42)
          }

           orLoginWithLabel.snp.makeConstraints {make in
               make.centerX.equalToSuperview()
               make.bottom.equalTo(socialButtonsStackView.snp.top).offset(-30)
               make.height.equalTo(12)
           }
           
           socialButtonsStackView.snp.makeConstraints {make in
               make.centerX.equalToSuperview()
               make.bottom.equalTo(signUpButton).offset(-70)
               make.height.equalTo(38)
               make.leading.trailing.equalToSuperview().inset(38)
           }
           
           signUpStackView.snp.makeConstraints {make in
               make.centerX.equalToSuperview()
               make.bottom.equalToSuperview().offset(-70)
               make.leading.trailing.equalToSuperview().inset(38)
           }
       }
    }
    




