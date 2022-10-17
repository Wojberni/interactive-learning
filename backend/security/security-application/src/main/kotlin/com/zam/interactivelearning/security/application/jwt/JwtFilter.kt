package com.zam.interactivelearning.security.application.jwt

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.GetUserByUsernameQuery
import com.zam.interactivelearning.security.application.userdetails.UserToUserDetailsConverter
import org.springframework.http.HttpHeaders
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.filter.OncePerRequestFilter
import javax.servlet.FilterChain
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class JwtFilter(
    private val jwtHelper: JwtHelper,
    private val executor: CqrsExecutor
): OncePerRequestFilter() {
    
    private val HEADER_PREFIX = "Bearer "

    override fun doFilterInternal(
        request: HttpServletRequest,
        response: HttpServletResponse,
        filterChain: FilterChain
    ) {
        val header = request.getHeader(HttpHeaders.AUTHORIZATION)
        if (header == null || !header.startsWith(HEADER_PREFIX)) {
            filterChain.doFilter(request, response)
            return
        }

        val token = header.split(" ")[1].trim()
        if (!jwtHelper.validateToken(token)) {
            filterChain.doFilter(request, response)
            return
        }

        val user = executor.executeQuery(GetUserByUsernameQuery(jwtHelper.getUsernameFromToken(token)))
        val userDetails = UserToUserDetailsConverter.convert(user)

        val authentication =
            UsernamePasswordAuthenticationToken(userDetails, null, userDetails.authorities)

        SecurityContextHolder.getContext().authentication = authentication

        filterChain.doFilter(request, response)
    }
}