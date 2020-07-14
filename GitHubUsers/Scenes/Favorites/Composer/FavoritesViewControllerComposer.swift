//
//  FavoriteViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesViewControllerComposer {
	
	static func makeModule() -> FavoritesViewController {
		
		let persistenceProvider = UserDefaultsPersistenceProvider()
		let interactor	= FavoritesInteractor(persistenceProvider: persistenceProvider)
		let presenter	= FavoritesPresenter()
		let viewController = FavoritesViewController(interactor: interactor)
		
		interactor.delegate		= presenter
		presenter.delegate		= viewController
		
		return viewController
	}
}

