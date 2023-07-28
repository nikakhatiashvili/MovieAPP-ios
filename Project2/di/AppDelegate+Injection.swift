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
        
        Resolver.register { SignUpUseCase(signUpRepository: Resolver.resolve()) }
    
        
        Resolver.register{SignInViewModel()}.scope(.graph)
        
        Resolver.register{SignInUseCase()}.scope(.graph)
        
        Resolver.register{SignInUseCase(signInRepository: Resolver.resolve())}
        
        Resolver.register{SignInRepositoryImpl()}.implements(SignInRepository.self)
        
        
        Resolver.register{FirebaseAuthMediator()}.implements(AuthenticationMediator.self)
        
        Resolver.register{HomeViewModel()}.scope(.graph)
        
        Resolver.register{MovieUseCase()}.scope(.graph)
//        Resolver.register{MovieUseCase(movieRepository:Resolver.resolve())}
        Resolver.register{MovieRepositoryImpl()}.implements(MovieRepository.self)
        Resolver.register{NetworkMediator()}.implements(MovieMediator.self)
        
    }
}

//extension Resolver {
//    public static func registerMyFirebase(){
//
//    }
//}
