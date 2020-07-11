//
//  UserDefaultsPersistenceProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import os

class UserDefaultsPersistenceProvider: PersistenceProvider {
	
	let userDefaults 	= UserDefaults.standard
	let key				= "49992A65-F05B-4C0B-84EE-6A5823E4571A"
	
	func save(favorites: [Follower]) throws {
		
		let encoder 		= JSONEncoder()
		let encodedData 	= try encoder.encode(favorites)
		userDefaults.set(encodedData, forKey: key)
	}
	
	func retreiveFavorites() -> [Follower]? {
		
		guard let encodedData = userDefaults.object(forKey: key) as? Data else { return nil }
		
		let decoder = JSONDecoder()

		do {
			
			return try decoder.decode([Follower].self, from: encodedData)
			
		} catch {
			
			return nil
		}
	}
	
	func add(favorite: Follower) {
		
		if var favorites = retreiveFavorites() {
			
			favorites.append(favorite)
			
			do {
				
				try save(favorites: favorites)
				
			} catch {
				
				os_log("Persistence, unable to add.")
			}
			
		} else {
			
			do {
				
				try save(favorites: [favorite])
			
			} catch {
				
				os_log("Persistence, unable to create a new set of favorites.")
			}
		}
	}
	
	func delete(favorite: Follower) {
		
		if var favorites = retreiveFavorites() {
			
			favorites.removeAll() {
				$0 == favorite
			}
			
			do {
				
				try save(favorites: favorites)
			
			} catch {
				
				os_log("Persistence, unable to save favorites after deleting")
				
			}
		}
	}
	
	func deleteAll() {
		
		userDefaults.removeObject(forKey: key)
	}
}

