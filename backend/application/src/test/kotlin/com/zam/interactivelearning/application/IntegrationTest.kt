package com.zam.interactivelearning.application

import com.zam.interactivelearning.security.application.configuration.SecurityConfiguration
import org.junit.jupiter.api.extension.ExtendWith
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.context.annotation.Import
import org.springframework.test.context.ActiveProfiles

@Retention(AnnotationRetention.RUNTIME)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ExtendWith(RestAssuredConfig::class)
@ActiveProfiles("test")
annotation class IntegrationTest()
