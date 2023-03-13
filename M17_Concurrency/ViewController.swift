//
//  ViewController.swift
//  M17_Concurrency
//
//  Created by Maxim NIkolaev on 08.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: Private Properties
    
    private let service = Service()
    private var imageArray = [UIImage]()
    private var imageViewArray = [UIImageView]()
    
    //MARK: IBOutlets
    
    private lazy var firstImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    private lazy var secondeImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    private lazy var thirdImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var fourthImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var fifthImageView: UIImageView = {
        let view = UIImageView()
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
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        view.addSubview(activityIndicator)
        imageViewArray = [firstImageView,secondeImageView,thirdImageView,fourthImageView,fifthImageView]
        setupConstraints()
        activityIndicator.startAnimating()
        onLoad()
    }

    // MARK: Privet func
    
    private func onLoad() {
        let queue = DispatchQueue.global (qos: .utility)
        queue.async{
            self.service.getImageURL { urlString, error in
                guard
                    let urlString = urlString
                else {
                    return
                }
                let image = self.service.loadImage(urlString: urlString)!
                self.imageArray.append(image)
                if self.imageArray.count != self.imageViewArray.count {
                    self.onLoad()
                }else{
                    self.setupImage()
                }
            }
        }
    }
    
    private func setupImage(){
        DispatchQueue.main.async {
            for (index,view) in self.imageViewArray.enumerated(){
                view.image = self.imageArray[index]
            }
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

