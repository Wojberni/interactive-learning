package com.zam.interactivelearning.application

import io.restassured.module.mockmvc.RestAssuredMockMvc.requestSpecification
import io.restassured.module.mockmvc.specification.MockMvcRequestSpecBuilder
import org.junit.jupiter.api.extension.BeforeAllCallback
import org.junit.jupiter.api.extension.ExtensionContext

class RestAssuredConfig: BeforeAllCallback {
    override fun beforeAll(context: ExtensionContext?) {
        requestSpecification = MockMvcRequestSpecBuilder()
            .setContentType("application/json")
            .build()
    }

}