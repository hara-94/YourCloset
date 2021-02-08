//
//  RegisterViewController.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import RxSwift
import UIKit
import UIComponent
import Util

protocol RegisterViewProtocol: RegisterBaseViewController { }

final class RegisterViewController: RegisterBaseViewController, RegisterViewProtocol {
    var presenter: RegisterPresenterProtocol!
    
    private let imageView: UIImageView = .init()
    private let expectedImageViewRatio: CGSize = .init(width: 167, height: 237)
    private let circleView: UIView = .init()
    private let iconView: UIImageView = .init()
    private let stackView: UIStackView = {
        let view: UIStackView = .init()
        view.axis = .vertical
        view.spacing = 21
        return view
    }()
    private let itemTextField: TextField = .init()
    private let catTextField: TextField = .init()
    private lazy var registerButton: UIButton = {
        let btn: UIButton = .init()
        btn.setTitle("登録", for: .normal)
        btn.setTitleColor(UIColor(red: 1/255, green: 76/255, blue: 134/255, alpha: 1), for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor(red: 1/255, green: 76/255, blue: 134/255, alpha: 1).cgColor
        btn.addTarget(self, action: #selector(register(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    private func setup() {
        iconView.image = UIImage(named: "camera")
        circleView.backgroundColor = .init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        circleView.layer.cornerRadius = 12
        registerButton.layer.cornerRadius = 20
        
        itemTextField.render("アイテム")
        catTextField.render("カテゴリー")
        
        navigationController?.navigationBar.isTranslucent = false
        imageView.backgroundColor = .black
        let imageViewSize = expectedImageViewRatio.scaleToFit(view.frame.width * 0.45)
        stackView.addArrangedSubviews([itemTextField, catTextField]).activateAutolayout()
        circleView.addSubviews([iconView]).activateAutolayout()
        view.addSubviews([imageView, circleView, stackView, registerButton]).activateAutolayout()
        Layout.activateLayouts([
            imageView.layout.top(constant: 24).left(constant: 16).width(imageViewSize.width).height(imageViewSize.height)
                .put(stackView).toRight(20)
                .put(registerButton).under(43),
            circleView.layout.size(24, 24).bottom(to: imageView, constant: 24).right(to: imageView, constant: -12),
            iconView.layout.size(16, 16).center(),
            stackView.layout.top(constant: 26).right(constant: 16),
            itemTextField.layout.top().left().right(),
            catTextField.layout.bottom().left().right(),
            registerButton.layout.size(202, 40).centerX()
        ])
    }
    
    @objc private func register(_: UIButton) {
        print("register")
    }
}

extension RegisterViewController {
    class TextField: UIView {
        private let titleLabel: UILabel = {
            let lbl: UILabel = .init()
            lbl.font = .systemFont(ofSize: 15)
            return lbl
        }()
        
        private let textField: UITextField = {
            let txt: UITextField = .init()
            txt.borderStyle = .roundedRect
            return txt
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            addSubviews([titleLabel, textField]).activateAutolayout()
            Layout.activateLayouts([
                titleLabel.layout.left().top().put(textField).under(12),
                textField.layout.left().right().bottom()
            ])
        }
        
        func render(_ title: String) {
            titleLabel.text = title
        }
    }
}

class RegisterBaseViewController: ScreenBaseViewController<RegisterDependency> {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "登録"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
