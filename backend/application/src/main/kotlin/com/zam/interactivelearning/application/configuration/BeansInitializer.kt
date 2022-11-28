package com.zam.interactivelearning.application.configuration

import com.zam.interactivelearning.infrastructure.application.configuration.BeanRegistry
import org.springframework.context.ApplicationContextInitializer
import org.springframework.context.support.GenericApplicationContext
import org.springframework.context.support.beans

class BeansInitializer: ApplicationContextInitializer<GenericApplicationContext> {
    override fun initialize(applicationContext: GenericApplicationContext) {
        BeanRegistry().beans().forEach { it.initialize(applicationContext) }
        beans {
            bean<CqrsInitializer>()
            profile("firebase") {
                bean<FirebaseInitializer>()
            }
        }.initialize(applicationContext)
    }
}