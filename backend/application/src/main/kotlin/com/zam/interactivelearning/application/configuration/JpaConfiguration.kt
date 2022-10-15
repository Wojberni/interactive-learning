package com.zam.interactivelearning.application.configuration

import org.springframework.boot.autoconfigure.domain.EntityScan
import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.repository.config.EnableJpaRepositories

@Configuration
@EnableJpaRepositories(basePackages = ["com.zam.interactivelearning.domain.application"])
@EntityScan(basePackages = ["com.zam.interactivelearning.domain.application"])
class JpaConfiguration {

}