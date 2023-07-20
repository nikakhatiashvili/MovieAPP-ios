//
//  AppDelegate+Injection.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import Resolver
import FirebaseAuth

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.register{SignUpUseCase()}.scope(.graph)
        Resolver.register { SignUpViewModel() }.scope(.graph)
        
        Resolver.register { SignUpRepositoryImpl() }.implements(SignUpRepository.self)
        Resolver.register { SignUpUseCase(signInRepository: Resolver.resolve()) }
    }
}

//extension Resolver {
//    public static func registerMyFirebase(){
//
//    }
//}
