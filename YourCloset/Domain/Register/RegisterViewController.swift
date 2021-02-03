//
//  RegisterViewController.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import UIKit
import UIComponent
import Util

protocol RegisterViewProtocol: RegisterBaseViewController { }

final class RegisterViewController: RegisterBaseViewController, RegisterViewProtocol {
    var presenter: RegisterPresenterProtocol!
    
    private let imageView: UIImageView = .init()
    private let expectedImageViewRatio: CGSize = .init(width: 167, height: 237)
    private let iconView: UIImageView = .init()
    private let stackView: UIStackView = {
        let view: UIStackView = .init()
        view.axis = .vertical
        view.spacing = 21
        return view
    }()
    private let itemTextField: TextField = .init()
    private let catTextField: TextField = .init()
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    private func setup() {
        itemTextField.render("アイテム")
        catTextField.render("カテゴリー")
        
        navigationController?.navigationBar.isTranslucent = false
        imageView.backgroundColor = .black
        let imageViewSize = expectedImageViewRatio.scaleToFit(view.frame.width * 0.45)
        stackView.addArrangedSubviews([itemTextField, catTextField]).activateAutolayout()
        view.addSubviews([imageView, stackView]).activateAutolayout()
        Layout.activateLayouts([
            imageView.layout.top(constant: 24).left(constant: 16).width(imageViewSize.width).height(imageViewSize.height)
                .put(stackView).toRight(20),
            stackView.layout.top(constant: 26).right(constant: 16),
            itemTextField.layout.top().left().right(),
            catTextField.layout.bottom().left().right(),
        ])
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
