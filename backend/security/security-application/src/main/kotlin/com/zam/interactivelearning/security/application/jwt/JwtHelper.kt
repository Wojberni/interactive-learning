package com.zam.interactivelearning.security.application.jwt

import com.auth0.jwt.JWT
import com.auth0.jwt.algorithms.Algorithm
import com.auth0.jwt.exceptions.JWTVerificationException
import com.zam.interactivelearning.security.api.ApplicationUserDetails
import org.springframework.beans.factory.annotation.Value
import java.time.LocalDateTime
import java.time.ZoneId

class JwtHelper(
    @Value("\${app.security.jwt.tokenSecret}")
    private val tokenSecret: String,
    @Value("\${app.security.jwt.tokenExpirationAfterSeconds}")
    private val tokenExpirationAfterSeconds: Long,
    @Value("\${app.security.jwt.tokenIssuer}")
    private val tokenIssuer: String,
) {

    private val ALGORITHM = Algorithm.HMAC512(tokenSecret)
    private val TOKEN_ID_KEY = "id"
    private val TOKEN_USERNAME_KEY = "username"


    fun createToken(userDetails: ApplicationUserDetails): String {
        return JWT.create()
            .withIssuer(tokenIssuer)
            .withIssuedAt(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant())
            .withExpiresAt(LocalDateTime.now().plusSeconds(tokenExpirationAfterSeconds).atZone(ZoneId.systemDefault()).toInstant())
            .withClaim(TOKEN_ID_KEY, userDetails.id)
            .withClaim(TOKEN_USERNAME_KEY, userDetails.username)
            .sign(ALGORITHM)
    }

    fun validateToken(token: String): Boolean {
        val verifier = JWT.require(ALGORITHM)
            .withIssuer(tokenIssuer)
            .build()

        try {
            verifier.verify(token)
        } catch (ex: JWTVerificationException) {
            return false
        }

        return  true
    }

    fun getUsernameFromToken(token: String): String {
        val decodedToken = JWT.decode(token)
        return decodedToken.claims[TOKEN_USERNAME_KEY]?.asString() ?: ""
    }
}