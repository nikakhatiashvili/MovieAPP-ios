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
        registerAuth()
        registerNetwork()
        registerSignIn()
        registerSignUp()
        registerMovie()
    }
    
    public static func registerAuth() {
        Resolver.register{FirebaseAuthMediator()}.implements(AuthenticationMediator.self)
    }
    public static func registerNetwork() {
        Resolver.register{NetworkMediator()}.implements(MovieMediator.self)
    }
    
    public static func registerSignIn(){
        Resolver.register{SignInViewModel()}.scope(.graph)
        Resolver.register{SignInUseCase()}.scope(.graph)
        Resolver.register{SignInUseCase(signInRepository: Resolver.resolve())}
        Resolver.register{SignInRepositoryImpl()}.implements(SignInRepository.self)
    }
    
    public static func registerSignUp(){
        Resolver.register{SignUpUseCase()}.scope(.graph)
        Resolver.register { SignUpViewModel() }.scope(.graph)
        Resolver.register { SignUpRepositoryImpl() }.implements(SignUpRepository.self)
        Resolver.register { SignUpUseCase(signUpRepository: Resolver.resolve()) }
    }
    
    public static func registerMovie(){
        Resolver.register{HomeViewModel()}.scope(.graph)
        Resolver.register{MovieUseCase()}.scope(.graph)
        Resolver.register{MovieRepositoryImpl()}.implements(MovieRepository.self)
        Resolver.register{MovieDetailViewModel()}.scope(.graph)
        Resolver.register{MovieDetailsUseCase()}.scope(.graph)
        Resolver.register{MovieDetailRepositoryImpl()}.implements(MovieDetailRepository.self)
    }
}
