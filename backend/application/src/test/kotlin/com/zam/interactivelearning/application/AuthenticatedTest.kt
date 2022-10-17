package com.zam.interactivelearning.application

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.GetUserByUsernameQuery
import com.zam.interactivelearning.security.application.jwt.JwtHelper
import com.zam.interactivelearning.security.application.userdetails.UserToUserDetailsConverter
import io.restassured.http.Header
import org.springframework.beans.factory.InitializingBean
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpHeaders

abstract class AuthenticatedTest: InitializingBean {
    @Autowired
    private lateinit var jwtHelper: JwtHelper
    @Autowired
    private lateinit var executor: CqrsExecutor

    lateinit var userJwt: String

    override fun afterPropertiesSet() {
        val user = executor.executeQuery(GetUserByUsernameQuery("test_user"))
        userJwt = jwtHelper.createToken(UserToUserDetailsConverter.convert(user))
    }

    fun getAuthHeader(jwt: String): Header {
        return Header(HttpHeaders.AUTHORIZATION, "Bearer $jwt")
    }
}