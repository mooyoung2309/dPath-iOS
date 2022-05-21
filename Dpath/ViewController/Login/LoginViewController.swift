//
//  LoginViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import Then
import RxGesture
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    var disposeBag = DisposeBag()
    var logoImageView = UIImageView(image: UIImage(named: ImageName.logo))
    var titleLabel = UILabel().then {
        $0.text = "대학문화 교류 플랫폼"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 22, weight: .regular)
    }
    var loginLabel = UILabel().then {
        $0.text = "SNS 계정으로 간편 가입하기"
        $0.textColor = UIColor.darkGray
        $0.font = .systemFont(ofSize: 12)
    }
    var loginImageView = UIImageView(image: UIImage(named: ImageName.login))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        
        loginImageView.rx.tapGesture()
            .withUnretained(self)
            .bind { owner, tap in
                if tap.state.rawValue == 3 {
                    let rootVC = RootViewController()
                    rootVC.modalPresentationStyle = .fullScreen
                    owner.present(rootVC, animated: true, completion: nil)
                }
            }
            .disposed(by: disposeBag)
    }
}

extension LoginViewController {
    func setView() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(loginImageView)
        view.addSubview(loginLabel)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 285),
            logoImageView.heightAnchor.constraint(equalToConstant: 38.11),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 21),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImageView.widthAnchor.constraint(equalToConstant: 343),
            loginImageView.heightAnchor.constraint(equalToConstant: 76.29),
            
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: loginImageView.topAnchor, constant: -6),
        ])
    }
}
