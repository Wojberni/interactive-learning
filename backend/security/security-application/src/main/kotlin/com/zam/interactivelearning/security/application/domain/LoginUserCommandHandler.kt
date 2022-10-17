package com.zam.interactivelearning.security.application.domain

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.security.api.ApplicationUserDetails
import com.zam.interactivelearning.security.api.LoginUserCommand
import com.zam.interactivelearning.security.application.jwt.JwtHelper
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import kotlin.reflect.KClass

class LoginUserCommandHandler(
    private val jwtHelper: JwtHelper,
    private val authenticationManager: AuthenticationManager,
): CommandHandler<LoginUserCommand, String> {

    override fun handle(command: LoginUserCommand): String {
        val authenticate = authenticationManager.authenticate(
            UsernamePasswordAuthenticationToken(
                command.username,
                command.password
            )
        )

        val userDetails = authenticate.principal as ApplicationUserDetails
        return jwtHelper.createToken(userDetails)
    }

    override fun supportedClass(): KClass<LoginUserCommand> {
        return LoginUserCommand::class
    }
}