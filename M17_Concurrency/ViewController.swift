//
//  ViewController.swift
//  M17_Concurrency
//
//  Created by Maxim NIkolaev on 08.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let service = Service()
    
    private lazy var firstImageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "1")
        view.contentMode = .scaleToFill
        return view
    }()
    private lazy var secondeImageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "1")
        view.contentMode = .scaleToFill
        return view
    }()
    private lazy var thirdImageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "1")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var fourthImageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "1")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var fifthImageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "1")
        view.contentMode = .scaleToFill
        return view
    }()
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.addArrangedSubview(firstImageView)
        stackView.addArrangedSubview(secondeImageView)
        stackView.addArrangedSubview(thirdImageView)
        stackView.addArrangedSubview(fourthImageView)
        stackView.addArrangedSubview(fifthImageView)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        view.addSubview(activityIndicator)
        setupConstraints()
        activityIndicator.startAnimating()
        onLoad()
    }

    private func onLoad() {
        service.getImageURL { urlString, error in
            guard
                let urlString = urlString
            else {
                return
            }
            
//            let imageOne = self.service.loadImage(urlString: urlString)
//            self.firstImageView.image = imageOne
//            let imageTwo = self.service.loadImage(urlString: urlString)
//            self.secondeImageView.image = imageTwo
//            let imageThree = self.service.loadImage(urlString: urlString)
//            self.thirdImageView.image = imageThree
//            let imageForth = self.service.loadImage(urlString: urlString)
//            self.fourthImageView.image = imageForth
//            let imageFive = self.service.loadImage(urlString: urlString)
//            self.fifthImageView.image = imageFive
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        secondeImageView.snp.makeConstraints { make in
            make.height.equalTo(firstImageView)
        }
        thirdImageView.snp.makeConstraints { make in
            make.height.equalTo(firstImageView)
        }
        fourthImageView.snp.makeConstraints { make in
            make.height.equalTo(firstImageView)
        }
        fifthImageView.snp.makeConstraints { make in
            make.height.equalTo(firstImageView)
        }
    }
}

