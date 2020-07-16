//
//  UserHeaderViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 17.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserHeaderViewController: UIViewController {

	let avatarImageView 		= AEAvatarImageView(frame: .zero)
	let userNameLabel			= AETitleLabel(textAlignment: .left)
	let nameLabel				= AESecondaryTitleLabel(textAlignment: .right)
	let locationImageView		= UIImageView(frame: .zero)
	let locationLable			= AESecondaryTitleLabel(textAlignment: .right)
	let bioLabel 				= AEBodyLabel(textAlignment: .left)
	
	let vMargin: CGFloat	= 0
	let hMargin: CGFloat	= 0
	let vPadding: CGFloat 	= 16
	let hPadding: CGFloat 	= 12
	
	init(user: UserViewModel?) {
		
		super.init(nibName: nil, bundle: nil)
		self.user = user
	}
	 
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
		configViewController()
		configAvatarImageView()
		configUserNameLabel()
		configNameLabel()
		configLocationImage()
		configLocationLabel()
		configBioLabel()
    }
	
	var user: UserViewModel? {
		
		didSet {
			
			guard let user = user else { return }
			
			if let avatar = user.avatar {
				
				self.avatarImageView.image = avatar
				
			} else {
				
				avatarImageView.image = Images.placeholder
			}
			
			userNameLabel.text 		= user.login
			nameLabel.text 			= user.name
			locationLable.text 		= user.location ?? "No Location"
			bioLabel.text 			= user.bio ?? "No bio available"
			
			locationImageView.image 		= Images.location
			locationImageView.tintColor 	= .secondaryLabel
		}
	}
	
	func configViewController() {
		
		view.backgroundColor = UIColor.systemBackground
	}
	
	func configAvatarImageView() {
		
		view.addSubview(avatarImageView)
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: hMargin),
			avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vMargin)
		])
	}
	
	func configUserNameLabel() {
		
		view.addSubview(userNameLabel)
		userNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			userNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
			userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: hPadding),
			userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin)
		])
	}
	
	func configNameLabel() {
		
		view.addSubview(nameLabel)
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
			nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: hPadding),
			nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin)
		])
	}
	
	func configLocationImage() {
		
		view.addSubview(locationImageView)
		locationImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: hPadding),
			locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0),
			locationImageView.heightAnchor.constraint(equalTo: locationImageView.widthAnchor),
			locationImageView.widthAnchor.constraint(equalToConstant: 20)
		])
	}
	
	func configLocationLabel() {
		
		view.addSubview(locationLable)
		locationLable.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			locationLable.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
			locationLable.bottomAnchor.constraint(equalTo: locationImageView.bottomAnchor, constant: 0),
			locationLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin)
		])
	}
	
	func configBioLabel() {
	
		bioLabel.numberOfLines 	= 3
		view.addSubview(bioLabel)
		bioLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: vPadding),
			bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
			bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin),
			bioLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -hMargin)
		])
	}
}
