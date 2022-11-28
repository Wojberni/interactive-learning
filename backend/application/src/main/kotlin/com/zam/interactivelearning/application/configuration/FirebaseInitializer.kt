package com.zam.interactivelearning.application.configuration

import com.google.auth.oauth2.GoogleCredentials
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.context.annotation.Profile
import javax.annotation.PostConstruct

class FirebaseInitializer(
    private val logger: Logger = LoggerFactory.getLogger(FirebaseInitializer::class.java)
) {

    @PostConstruct
    fun init() {
        logger.info("Starting Firebase initialization")

        val options = FirebaseOptions.builder()
            .setCredentials(GoogleCredentials.getApplicationDefault())
            .build()

        FirebaseApp.initializeApp(options)

        logger.info("Firebase initialized")
    }
}