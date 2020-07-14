//
//  FollowersViewControllerInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

protocol FollowersViewControllerInput: UIViewController {
	
	func representFollowers(ofUsername username: String)
}

